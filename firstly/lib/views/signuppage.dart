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
                              GestureDetector(
                                child: Container(
                                  height: 50.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 2, 39, 39),
                                    borderRadius: BorderRadius.circular(20),
                                  ),

                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                onTap: () async {
                                  if (username.text.isEmpty) {
                                    Get.snackbar(
                                      "error",
                                      "Please Enter Username",
                                    );
                                  } else if (phone.text.isEmpty) {
                                    Get.snackbar(
                                      "Error",
                                      "Please Enter Phone Number",
                                    );
                                  } else if (email.text.isEmpty) {
                                    Get.snackbar("Error", "Please Enter Email");
                                  } else if (password.text.isEmpty ||
                                      passwordAgain.text.isEmpty ||
                                      password.text.toString().compareTo(
                                            passwordAgain.text.toString(),
                                          ) !=
                                          0) {
                                    Get.snackbar(
                                      "Error",
                                      " Password and Password confimation should be none empty and matching ",
                                    );
                                  } else {
                                    final response = await http.get(
                                      Uri.parse(
                                        "http://192.168.0.111/travelapp/create.php? here}}?id=&Name=${username.text}&Email=${email.text}&Password=${password.text}",
                                      ),
                                    );
                                    if (response.statusCode == 200) {
                                      final serverData = jsonDecode(
                                        response.body,
                                      );
                                      if (serverData["success"] == 1) {
                                        Get.snackbar(
                                          "Success",
                                          "You are registered",
                                        );
                                        Get.offAndToNamed("/");
                                      } else {
                                        Get.snackbar(
                                          "Failed",
                                          "Registration Failed. Email may already exist."
                                        );

                                      }
                                    } else {
                                      Get.snackbar(
                                        "Error ","server error :{response.statusCode}"
                                      );
                                    }
                                  }
                                },
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

// class _SignUpPageState extends State<SignUpPage> {
//   @override
//   widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(backroundcolor: Colors.transparent,elevation:0),
//       extendBodyBehindAppBar:true,
//       body:Stack(
//         children:[
//           image.asset(
//             "assets/netflix.webp",
//             fit:BoxFit.cover,
//             height:double.infinity,
//             width:double.infinity,
//           ),
//           SafeArea(
//             bottom: false,
//              child:Container(
//               padding: EdgeInsets.symmetric(vertical: 30.0),
//               width: double.infinity,
//                child:Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                  children:[
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
//                     child:Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children:[
//                         //sizedBox(height: 10.0),
              
                        
//                         Text("Sign Up",
//                         style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white)),
                
//                    SizedBox(height: 10),
//                    Text(
//                     "Welcome!",
//                     style: TextStyle(fontSize: 18, color: Colors.white70),
//                    )
//                       ],
//                     ),
//                   ),
//                    SizedBox(height: 15),
//                    Expanded( 
//                     child:Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(60),
//                           topRight: Radius.circular(60),
//                         ),
//                       ),
//                       child:SingleChildScrollView(
//                         child:Padding(
//                           padding: const EdgeInsets.fromLTRB(20.0,60,20.0,20.0),
//                           child:Column(
//                             children:[
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child:Container(
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(30),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.fromARGB(255, 214, 183, 8)),
//                                         blurRadius: 10,
//                                         offset: Offset(0, 5),
//                                       ),
//                                     ],
//                                   ),
                 
//                                   child:Column(
//                                   children:[
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
//                                       ),
//                                     )
//                                     child:TextFormField(
//                                       decoration: InputDecoration(
//                                         hintText: "Full Name",
//                                         prefixIcon: Icon(Icons.person),
//                                         border: InputBorder.none,
//                                       ),
//                                     )
//                                 ),
//                                  ),
//                                   ],
//                                    ),
//                                     ),
//                                     Container(
//                                       decoration:Box decoration(
//                                         border:Border(
//                                           bottom: BorderSide(color: Colors.grey.shade200),
//                                         ),
//                                       )
//                                     )
                              
//                                child:TextFormField(
//                                 decoration: InputDecoration(
//                                   hintText: "Enter Email",
//                                   prefixIcon: Icon(Icons.email),
//                                   border: OutlineInputBorder(
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               // SizedBox(height: 20),
//                               // TextField(
//                               //   obscureText: true,
//                               //   decoration: InputDecoration(
//                               //     hintText: "Password",
//                               //     prefixIcon: Icon(Icons.lock),
//                               //     border: OutlineInputBorder(
//                               //       borderRadius: BorderRadius.circular(30),
//                               //     ),
//                                 ),
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                   border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
//                                 ),
//                                 child:TextFormField(
//                                   obscureText: true,
//                                   decoration: InputDecoration(
//                                     hintText: "Mobile Number",
//                                     prefixIcon: Icon(Icons.phone),
//                                     border: InputBorder.none,
//                                   ),
//                                 ),
//                               ),
                              
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.redAccent,
//                         bottom:BorderSide(color: Colors.grey.shade200),
//                       ),
//                     )
//                    Child: TextFormField(
//                     obscureText: true,
//                     obscuringCharacter: '*',
//                     decoration: InputDecoration(
//                       hintText: "Password",
//                       prefixIcon: Icon(Icons.lock),
//                       suffixIcon: Icon(Icons.remove_red_eye),
//                       border: InputBorder.none,
//                     ),
//                    ),
                   
//                    Container(
//                                         decoration: BoxDecoration(
//                                           border: Border(
//                                             bottom: BorderSide(
//                                               color: Colors.grey,
//                                             ),
//                                           ),
//                                         ),
//                                         child: TextFormField(
//                                           decoration: InputDecoration(
//                                             border: InputBorder.none,

//                                             hintText: "Confirm password",
//                                             prefixIcon: Icon(Icons.lock),
//                                             suffixIcon: Icon(
//                                               Icons.remove_red_eye,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 40.0),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Forgot password?",
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 30),
//                               Container(
//                                 height: 50.0,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   color: const Color.fromARGB(255, 3, 52, 5),
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: Text(
//                                   "Sign up",
//                                   style: TextStyle(
//                                     fontSize: 16.0,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 20),
//                               TextField(),
//                               Text(
//                                 "Sign up with",

//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                               SizedBox(height: 40),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Logo(Logos.facebook_f),
//                                   Logo(Logos.twitter),
//                                   Logo(Logos.google),
//                                   Logo(Logos.apple),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }