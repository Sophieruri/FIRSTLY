import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController username = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController passwordAgain = TextEditingController();

class Signuppage extends StatefulWidget {
  const Signuppage({Key? key}) : super(key: key);

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

             
              SvgPicture.asset("assets/airtale_logo.svg", height: 120),

              const SizedBox(height: 16),

              Text(
                "Create Account",
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF023232),
                ),
              ),
              Text(
                "Start your journey today",
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 30),

              _buildField(
                controller: username,
                hint: "Full Name",
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),

             
              _buildField(
                controller: email,
                hint: "Email Address",
                icon: Icons.email_outlined,
                type: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              
              _buildField(
                controller: phone,
                hint: "Mobile Number",
                icon: Icons.phone_outlined,
                type: TextInputType.phone,
              ),
              const SizedBox(height: 16),

              
              TextField(
                controller: password,
                obscureText: _obscurePassword,
                style: GoogleFonts.poppins(fontSize: 14),
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
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
              const SizedBox(height: 16),

             
              TextField(
                controller: passwordAgain,
                obscureText: _obscureConfirm,
                style: GoogleFonts.poppins(fontSize: 14),
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color(0xFF0077B6),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () =>
                        setState(() => _obscureConfirm = !_obscureConfirm),
                    child: Icon(
                      _obscureConfirm
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0077B6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () async {
                    if (username.text.isEmpty) {
                      Get.snackbar("Error", "Please enter your name");
                      return;
                    } else if (email.text.isEmpty) {
                      Get.snackbar("Error", "Please enter email");
                      return;
                    } else if (phone.text.isEmpty) {
                      Get.snackbar("Error", "Please enter phone number");
                      return;
                    } else if (password.text.isEmpty ||
                        passwordAgain.text.isEmpty ||
                        password.text != passwordAgain.text) {
                      Get.snackbar("Error", "Passwords don't match");
                      return;
                    }

                    final url =
                        "http://localhost/travelapp/create.php?Name=${username.text}&Email=${email.text}&Phone=${phone.text}&Password=${password.text}";

                    try {
                      final response = await http.get(Uri.parse(url));
                      if (response.statusCode == 200) {
                        final serverData = jsonDecode(response.body);
                        if (serverData["success"] == 1) {
                          Get.snackbar("Success", "Account created!");
                          Get.offAllNamed("/");
                        } else {
                          Get.snackbar(
                            "Failed",
                            "Registration failed. Email may already exist.",
                          );
                        }
                      } else {
                        Get.snackbar(
                          "Error",
                          "Server error: ${response.statusCode}",
                        );
                      }
                    } catch (e) {
                      Get.snackbar("Error", "Connection failed");
                    }
                  },
                  child: Text(
                    "Sign up",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or sign up with",
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 20),

             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Logo(Logos.facebook_f),
                  Logo(Logos.twitter),
                  Logo(Logos.google),
                  Logo(Logos.apple),
                ],
              ),

              const SizedBox(height: 20),
 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAllNamed("/"),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF0077B6),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType type = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: type,
      style: GoogleFonts.poppins(fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
        prefixIcon: Icon(icon, color: const Color(0xFF0077B6)),
      ),
    );
  }
}
