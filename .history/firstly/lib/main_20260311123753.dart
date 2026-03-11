import 'package:flutter/material.dart';
void main() {
  runApp(
    GetMaterialApp(
      InitialRoute:"/",
      getPages:
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
                