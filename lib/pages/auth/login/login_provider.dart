import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPageProvider extends ChangeNotifier {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool showPassword = false;
  bool checkedValue = true;

  onChangeCheckBox(value) {
    checkedValue = value;
    notifyListeners();
  }

  onShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  onLogin(BuildContext context) {}
}
