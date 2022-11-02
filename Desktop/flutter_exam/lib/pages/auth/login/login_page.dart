import 'package:flutter/material.dart';
import 'package:flutter_exam/pages/auth/login/login_provider.dart';
import 'package:flutter_exam/pages/auth/login/login_styles.dart';
import 'package:flutter_exam/pages/widgets/button.dart';
import 'package:flutter_exam/pages/auth/login/widgets/check_box.dart';
import 'package:flutter_exam/pages/auth/login/widgets/field.dart';
import 'package:provider/provider.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginPageProvider>(
      create: (context) => LoginPageProvider(),
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Consumer<LoginPageProvider>(
              builder: (context, provider, child) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(child: Image.asset('images/logo.png')),
                  field(provider),
                  checkBoxField(provider),
                  buttonWidget(provider, context,
                      text: 'Login', color: LoginStyles.mainColor),
                  const Text('Forgot Password',
                      style: TextStyle(decoration: TextDecoration.underline)),
                  const Text('Sign Up', style: TextStyle(fontSize: 20)),
                ],
              ),
            )),
      ),
    );
  }
}
