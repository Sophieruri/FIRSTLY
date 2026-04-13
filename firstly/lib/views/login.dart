import 'dart:convert';

import 'package:firstly/controllers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // appBar: AppBar(
      // backgroundColor: Colors.deepOrangeAccent,
      // title: Text(
      // "Login Screen",
      //style: TextStyle(
      // color: Colors.white,
      // fontSize: 40,
      //fontStyle: FontStyle.normal,
      //centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/download.jpg"),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 20, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Enter Username",

                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                  hint: Text("Email or phone number"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 20, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Enter Password",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 20, 5),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  hint: Text("Pin or Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      logincontroller.isPasswordVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    // onTap:(){
                    //   logincontroller.togglePassword();
                    // }
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // MaterialButton(
            //   onPressed: () {},
            //   child: Text("signup", style: TextStyle(color: Colors.white)),
            //   color: Colors.deepOrangeAccent,

            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: GestureDetector(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 2, 39, 39),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Text(
                    "login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                onTap: () async {
                  if (username.text.isEmpty) {
                    Get.snackbar("Error", "Enter email");
                  } else if (password.text.isEmpty) {
                    Get.snackbar("Error", "Enter password");
                  } else {
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
                  }
                },
              ),
            ),
            Row(
              children: [
                Text("Don't have an account?"),

                GestureDetector(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 39, 39),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onTap: () {
                    Get.toNamed("/signup");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
