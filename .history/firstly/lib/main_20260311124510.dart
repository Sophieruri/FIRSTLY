import 'package:firstly/configs/routes.dart';
import 'package:firstly/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
void main() {
  runApp(const MyApp());
  
}
class MyApp extends StatelessWidget {
const MyApp({Key. key}) : super(key: key);
     GetMaterialApp(
      initialRoute: "/",
      getPages:routes,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    
    );
  }
                