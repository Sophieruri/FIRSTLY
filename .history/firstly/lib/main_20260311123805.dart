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
                