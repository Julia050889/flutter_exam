import 'package:flutter/material.dart';
import 'package:flutter_exam/base/styles/color.dart';
import 'package:flutter_exam/pages/home/widgets/drawer.dart';
import 'package:flutter_exam/pages/home/widgets/grid_view.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Style.red, size: 40),
            flexibleSpace: Image.asset(
              'images/logo.png',
              scale: 2,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          endDrawer: buildDrawer(context),
          body: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Expanded(child: buildGrid(context)),
              Image.asset('images/home_page/image.png'),
            ],
          )),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(70))),
        elevation: 0,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close, size: 40, color: Style.red)),
            ),
            const SizedBox(
              height: 70,
            ),
            Column(
              children: [
                drawItem(
                  text: 'Score',
                  image: Image.asset('images/home_page/drawer/1.png'),
                ),
                drawItem(
                  text: 'Prize Payout',
                  image: Image.asset('images/home_page/drawer/2.png'),
                ),
                drawItem(
                  text: 'Rules',
                  image: Image.asset('images/home_page/drawer/3.png'),
                ),
                drawItem(
                  text: 'Support',
                  image: Image.asset('images/home_page/drawer/4.png'),
                ),
                drawItem(
                  text: 'About',
                  image: Image.asset('images/home_page/drawer/5.png'),
                ),
                drawItem(
                  text: 'Buy Our Book',
                  image: Image.asset('images/home_page/drawer/6.png'),
                ),
                drawItem(
                  text: 'Sign Out',
                  image: Image.asset('images/home_page/drawer/7.png'),
                ),
              ],
            ),
          ],
        ));
  }
}
