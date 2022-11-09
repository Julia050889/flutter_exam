import 'package:flutter/material.dart';
import 'package:flutter_exam/base/route.dart';
import 'package:flutter_exam/pages/auth/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exam project',
      home: LoginPageWidget(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
