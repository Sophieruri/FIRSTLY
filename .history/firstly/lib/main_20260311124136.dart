import 'package:firstly/configs/routes.dart';
import 'package:firstly/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
void main() {
  runApp(
    GetMaterialApp(
      nitialRoute:"/",
      getPages:routes,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    
    );
  }
                