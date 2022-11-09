import 'package:flutter/material.dart';
import 'package:flutter_exam/base/route.dart';
import 'package:flutter_exam/base/styles/color.dart';
import 'package:flutter_exam/pages/home/widgets/gird_item.dart';

Widget buildGrid(BuildContext context) {
  return GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    children: <Widget>[
      gridItem(
          route: AppRoutes.animation,
          context: context,
          text: 'Play Now',
          image: Image.asset('images/home_page/1.png'),
          color: Style.purple,
          topleft: false),
      gridItem(
          route: AppRoutes.purchases,
          context: context,
          text: 'Purchases',
          image: Image.asset('images/home_page/2.png'),
          color: Style.green,
          topleft: true),
      gridItem(
        route: AppRoutes.leaderboard,
        context: context,
        text: 'Leaderboard',
        image: Image.asset('images/home_page/3.png'),
        color: Style.orange,
        topleft: false,
      ),
      gridItem(
          context: context,
          text: 'Profile',
          image: Image.asset('images/home_page/4.png'),
          color: Style.blue,
          topleft: true),
    ],
  );
}
