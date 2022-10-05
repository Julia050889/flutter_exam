import 'package:flutter/material.dart';
import 'package:quiz_flutter/base/route.dart';
import 'package:quiz_flutter/pages/auth/login/login_page.dart';
import 'package:quiz_flutter/pages/home/home_page.dart';
import 'package:quiz_flutter/pages/onboard/onboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter task',
      home: const HomePageWidget(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
