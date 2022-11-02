import 'package:flutter/material.dart';
import 'package:flutter_exam/pages/auth/login/login_styles.dart';

Widget field(provider) {
  return Column(
    children: [
      TextField(
        controller: provider.usernameCtrl,
        decoration: const InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: LoginStyles.mainColor),
          ),
          hintText: 'Email',
          focusColor: LoginStyles.mainColor,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      TextField(
        obscureText: !provider.showPassword,
        controller: provider.passwordCtrl,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: LoginStyles.mainColor),
          ),
          hintText: 'Password',
          suffixIcon: IconButton(
            onPressed: provider.onShowPassword,
            icon: provider.showPassword
                ? const Icon(
                    Icons.visibility,
                    color: LoginStyles.mainColor,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: LoginStyles.mainColor,
                  ),
          ),
        ),
      ),
    ],
  );
}
