import 'package:firstly/views/login.dart';
import 'package:get/get_navigation/get_navigation.dart';

var routes = [
  GetPage(name: "/", page: () => LoginScreen()),
  GetPage(name: "/signup", page: () => Signupen()),
  GetPage(name: "/homescreen", page: () => HomeScreen()),
];
