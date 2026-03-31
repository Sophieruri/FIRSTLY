import 'package:get/state_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignupController extends GetxController {
  var username;
  var email;
  var phone;
  var password;
  var passwordAgain;
 
  
  var isPasswordVisible = false.obs;
  bool signup(user, mail, pass, passAgain, ph,) {
    username = user;
    password = pass;
    email = mail;
    phone = ph;
    passwordAgain = passAgain;
    
    
    if (username == "admin" &&
        password == "12345" &&
        email == "sophie@gmail.com " &&
        phone == 0794000140) {
      return true;
    } else {
      return false;
    }
    // if (password != passwordAgain) {
    //   return false;
    // }
  }

  togglepassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
