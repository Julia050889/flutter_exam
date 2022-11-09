import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/base/route.dart';
import 'package:flutter_exam/pages/auth/login/bloc/login_bloc.dart';
import 'package:flutter_exam/pages/auth/login/widgets/field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginPageBloc(),
      child: ReactiveFormConfig(
        validationMessages: {
          'required': (error) => 'Fields must be nor be empty',
          'email': (error) => 'Please enter correct email address',
          'pattern': (error) =>
              'Password must be include uppercase and lowercase letters and characters',
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: BlocBuilder<LoginPageBloc, LoginPageState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(child: Image.asset('assets/images/logo.png')),
                    field(context, state),
                    const Text('Forgot Password',
                        style: TextStyle(decoration: TextDecoration.underline)),
                    const Text('Sign Up', style: TextStyle(fontSize: 20)),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  onLogin(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.description);
  }
}
