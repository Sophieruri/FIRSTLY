import 'package:firstly/views/homescreen.dart';
import 'package:firstly/views/login.dart';
import 'package:firstly/views/signuppage';
import 'package:get/get_navigation/get_navigation.dart';

var routes = [
  GetPage(name: "/", page: () => LoginScreen()),
  GetPage(name: "/signup", page: () => SignUpPage()),
  GetPage(name: "/homescreen", page: () => HomeScreenPg()),
];
