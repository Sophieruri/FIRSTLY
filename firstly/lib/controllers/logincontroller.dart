import 'package:get/state_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginController extends GetxController {
  var username;
  var password;
  var isPasswordVisible = false.obs;
  login(user, pass) {
    username = user;
    password = pass;
    if (username == "admin" && password == "12345") {
      return true;
    } else {
      return false;
    }
  }
}

// togglepassword() {
//   isPasswordVisible.value = isPasswordVisible.value;
// }
