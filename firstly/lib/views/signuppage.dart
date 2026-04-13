import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/image.png",
              fit: BoxFit.cover,
              // height: double.infinity,
              // width: double.infinity,
            ),
          ),
          SafeArea(
            bottom: false,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30.0),

              width: double.infinity,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 40.0,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Weclome!",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                          255,
                                          2,
                                          39,
                                          39,
                                        ),
                                        blurRadius: 20,
                                        offset: Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: username,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,

                                            hintText: "Full Name",
                                            prefixIcon: Icon(Icons.person),
                                          ),
                                        ),
                                      ),

                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: email,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,

                                            hintText: "Enter Email",
                                            prefixIcon: Icon(Icons.person),
                                          ),
                                        ),
                                      ),

                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: phone,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,

                                            hintText: "Moblie number",
                                            prefixIcon: Icon(Icons.person),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: password,
                                          obscureText: true,
                                          obscuringCharacter: '*',
                                          decoration: InputDecoration(
                                            border: InputBorder.none,

                                            hintText: "Password",
                                            prefixIcon: Icon(Icons.lock),
                                            suffixIcon: Icon(
                                              Icons.remove_red_eye,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: passwordAgain,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,

                                            hintText: "Confirm password",
                                            prefixIcon: Icon(Icons.lock),
                                            suffixIcon: Icon(
                                              Icons.remove_red_eye,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 40.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Forgot password?",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),

                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                      255,
                                      2,
                                      39,
                                      39,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () async {
                                    print("BUTTON CLICKED");

                                    if (username.text.isEmpty) {
                                      Get.snackbar(
                                        "Error",
                                        "Please enter your name",
                                      );
                                      return;
                                    } else if (email.text.isEmpty) {
                                      Get.snackbar(
                                        "Error",
                                        "Please enter email",
                                      );
                                      return;
                                    } else if (phone.text.isEmpty) {
                                      Get.snackbar(
                                        "Error",
                                        "Please enter phone number",
                                      );
                                      return;
                                    } else if (password.text.isEmpty ||
                                        passwordAgain.text.isEmpty ||
                                        password.text != passwordAgain.text) {
                                      Get.snackbar(
                                        "Error",
                                        "Passwords don't match",
                                      );
                                      return;
                                    }

                                    final url =
                                        "http://localhost/travelapp/create.php?Name=${username.text}&Email=${email.text}&Phone=${phone.text}&Password=${password.text}";

                                    print("URL: $url");

                                    try {
                                      final response = await http.get(
                                        Uri.parse(url),
                                      );

                                      print("Status: ${response.statusCode}");
                                      print("Body: ${response.body}");

                                      if (response.statusCode == 200) {
                                        final serverData = jsonDecode(
                                          response.body,
                                        );

                                        if (serverData["success"] == 1) {
                                          Get.snackbar(
                                            "Success",
                                            "Account created!",
                                          );
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
                                      print("ERROR: $e");
                                      Get.snackbar(
                                        "Error",
                                        "Connection failed",
                                      );
                                    }
                                  },
                                  child: const Text(
                                    "Sign up",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(),
                              Text(
                                "Sign up with",

                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Logo(Logos.facebook_f),
                                  Logo(Logos.twitter),
                                  Logo(Logos.google),
                                  Logo(Logos.apple),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
