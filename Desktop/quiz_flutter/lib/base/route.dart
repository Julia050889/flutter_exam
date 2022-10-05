import 'package:flutter/material.dart';
import 'package:quiz_flutter/pages/auth/login/login_page.dart';
import 'package:quiz_flutter/pages/home/home_page.dart';

import 'package:quiz_flutter/pages/onboard/onboard_page.dart';

class AppRoutes {
  static const login = '/';
  static const homepage = '/homepage';
  static const onboardingpage = '/onboardingpage';
  // static const settingpage = '/settingpage';
  // static const feedback = '/feedback';
  // static const detail = '/detail';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    PageArguments? pageArguments;
    if (settings.arguments != null) {
      pageArguments = (settings.arguments as PageArguments);
    }

    var routes = <String, WidgetBuilder>{
      AppRoutes.login: (context) => const LoginPageWidget(),
      AppRoutes.homepage: (context) => const HomePageWidget(),
      AppRoutes.onboardingpage: (context) => const OnBoardingPage(),
    };

    WidgetBuilder builder = routes[settings.name] ?? routes.values.first;
    return MaterialPageRoute(builder: (ctx) => builder(ctx));
  }
}

class PageArguments {
  final String? pageTitle;
  final Map<String, dynamic>? data;

  PageArguments({
    this.pageTitle,
    this.data,
  });
}
