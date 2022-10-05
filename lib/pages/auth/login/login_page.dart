import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_flutter/pages/auth/login/login_provider.dart';
import 'package:quiz_flutter/pages/auth/login/widgets/field.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(),
      child: Scaffold(
          body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 100,
            right: 101,
            top: 40,
          ),
          child: Image.asset('images/1.png'),
        ),
        const SizedBox(height: 50),
        field(),
        const SizedBox(height: 30),
        TextButton(
            onPressed: () {},
            child: const Text('Forgot password?',
                style: TextStyle(color: Colors.black))),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {},
          child: const Text('Sign Up',
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
      ])),
    );
  }

  Widget field() {
    return Consumer<LoginProvider>(
      builder: (context, provider, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            TextField(
              controller: provider.usernameCtrl,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: provider.passwordCtrl,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            SizedBox(height: 20),
            checkBox(provider),
            const SizedBox(height: 40),
            buttonWidget(context, provider),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget checkBox(provider) {
    return CheckboxListTile(
      title: const Text("Remember password"),
      value: provider.checkedValue,
      onChanged: (value) => provider.onChangeBox(value),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  Widget buttonWidget(BuildContext context, provider) {
    return ElevatedButton(
      onPressed: () {
        provider.onLogin(context);
      },
      child: const Text('Login', style: TextStyle(fontSize: 20)),
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          )),
          primary: Colors.red),
    );
  }
}
