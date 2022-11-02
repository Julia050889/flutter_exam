import 'package:flutter/material.dart';
import 'package:flutter_exam/pages/auth/login/login_page.dart';
import 'package:flutter_exam/pages/description/description_page.dart';
import 'package:flutter_exam/pages/home/home_page.dart';
import 'package:flutter_exam/pages/leaderboard/leaderboard_page.dart';
import 'package:flutter_exam/pages/purchases/purchases.dart';
import 'package:flutter_exam/pages/purchases/purchases_provider.dart';
import 'package:flutter_exam/pages/quiz/quiz_page.dart';

class AppRoutes {
  static const login = '/';
  static const homepage = '/homepage';
  static const description = '/description';
  static const leaderboard = '/leaderboard';
  static const purchases = '/purchases';
  static const quiz = '/quiz';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    PageArguments? pageArguments;
    if (settings.arguments != null) {
      pageArguments = (settings.arguments as PageArguments);
    }

    var routes = <String, WidgetBuilder>{
      AppRoutes.login: (context) => const LoginPageWidget(),
      AppRoutes.description: (context) => const DescriptionPageWidget(),
      AppRoutes.homepage: (context) => const HomePageWidget(),
      AppRoutes.leaderboard: (context) => const LeaderBoardPageWidget(),
      AppRoutes.purchases: (context) => const PurchasesPageWidget(),
      AppRoutes.quiz: (context) => const QuizPageWidget(),
      //AppRoutes.homepage: (context) => const HomePageWidget(),
      //AppRoutes.onboardingpage: (context) => const OnBoardingPage(),
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
