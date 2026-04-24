import 'dart:convert';
import 'package:firstly/controllers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

LoginController logincontroller = Get.put(LoginController());
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // ── Logo / Header ────────────────────────
              Center(
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0077B6), Color(0xFF00B4D8)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.flight,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  "Welcome Back",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF023232),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Sign in to continue your journey",
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                ),
              ),

              const SizedBox(height: 40),

              // ── Email ────────────────────────────────
              Text(
                "Email",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF023232),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: username,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Color(0xFF0077B6),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── Password ─────────────────────────────
              Text(
                "Password",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF023232),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: password,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color(0xFF0077B6),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                    child: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // ── Login Button ─────────────────────────
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0077B6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () async {
                    if (username.text.isEmpty) {
                      Get.snackbar("Error", "Enter email");
                      return;
                    }
                    if (password.text.isEmpty) {
                      Get.snackbar("Error", "Enter password");
                      return;
                    }
                    try {
                      final response = await http.post(
                        Uri.parse("http://localhost/travelapp/login.php"),
                        body: {
                          'Email': username.text,
                          'Password': password.text,
                        },
                      );
                      if (response.statusCode == 200) {
                        final serverData = jsonDecode(response.body);
                        if (serverData['code'] == 1) {
                          Get.offAllNamed('/homescreen');
                        } else {
                          Get.snackbar(
                            "Wrong Credentials",
                            serverData["message"],
                          );
                        }
                      } else {
                        Get.snackbar(
                          "Server Error",
                          "Error occurred while logging in",
                        );
                      }
                    } catch (e) {
                      Get.snackbar("Error", "Could not connect to server");
                    }
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ── Sign up link ─────────────────────────
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.poppins(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed("/signup"),
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF0077B6),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
