import 'package:firstly/configs/routes.dart';
import 'package:firstly/views/login.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(
    GetMaterialApp(
      InitialRoute:"/",
      getPages:routes,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
                