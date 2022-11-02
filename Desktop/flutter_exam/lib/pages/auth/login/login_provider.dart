import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/base/reg_exp.dart';
import 'package:flutter_exam/base/route.dart';
import 'package:flutter_exam/pages/auth/login/widgets/dialog.dart';

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

  onLogin(BuildContext context) {
    final regexp = RegExp(RegularExpressions.email);
    if (usernameCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty) {
      if (regexp.hasMatch(usernameCtrl.text)) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.description);
      } else {
        return showDialog(
            context: context,
            builder: (context) {
              return dialog(
                  title: 'Error',
                  content: 'Please enter a valid email field',
                  context);
            });
      }
    } else {
      return showDialog(
          context: context,
          builder: (context) {
            return dialog(
                title: 'Error', content: 'Some field is empty', context);
          });
    }
  }
}
