import 'package:firstly/controllers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

LoginController logincontroller = Get.put(LoginController());
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

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
            //Text( Text(
            //   "Jumia Marketplace",
            //   style: TextStyle(
            //     color: Colors.blue,
            //     fontSize: 30,
            //     fontWeight: FontWeight.w800,
            //   ),
            //),
            // ),
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
                controller: usernameController,
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
                obscureText: logincontroller.isPasswordVisible.value,
                controller: passwordController,
                decoration: InputDecoration(
                  hint: Text("Pin or Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: GestureDetector(child: Icon(
                    logincontroller.isPasswordVisible.value
                    ?Icons.visibility_off
                    :Icons.visibility,
                    )
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
                onTap: () {
                  bool success = logincontroller.login(
                    usernameController.text,
                    passwordController.text,
                  );
                  if (success) {
                    Get.offAndToNamed("/homescreen");
                  } else {
                    Get.snackbar(
                      "Login Failed",
                      "Invalid username or password",
                      
                    );
                  }
                  // Get.toNamed("/homescreen");
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
