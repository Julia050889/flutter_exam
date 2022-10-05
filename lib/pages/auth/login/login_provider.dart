import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_flutter/base/reg_exp.dart';
import 'package:quiz_flutter/base/route.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool checkedValue = true;
  onChangeBox(value) {
    checkedValue = value;
    notifyListeners();
  }

  onLogin(BuildContext context) {
    final regExp = RegExp(RegularExpressions.email);

    if (usernameCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty) {
      if (regExp.hasMatch(usernameCtrl.text)) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.onboardingpage);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return dialog(
              context,
              title: 'Error',
              content: 'Username is invalid',
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return dialog(
            context,
            title: 'Error',
            content: 'Some of the credentials are empty',
          );
        },
      );
    }
  }

  Widget dialog(
    context, {
    required String title,
    String? content,
  }) {
    return AlertDialog(
      title: Text(title),
      content: Text(content ?? 'Some of the credentials are empty'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
