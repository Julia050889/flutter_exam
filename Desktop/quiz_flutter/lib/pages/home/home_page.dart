import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.red),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Image.asset('images/1.png'),
        ),
        endDrawer: buildDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    buildConatiner(
                        icon: Icons.play_arrow,
                        text: 'Play',
                        color: Colors.purple),
                    buildConatiner(
                        icon: Icons.add_card_sharp,
                        text: 'Purchases',
                        color: Colors.green),
                  ],
                ),
                Row(
                  children: [
                    buildConatiner(
                        icon: Icons.leaderboard,
                        text: 'Leaderboard',
                        color: Colors.amber),
                    buildConatiner(
                        icon: Icons.verified_user,
                        text: 'Profile',
                        color: Colors.blue),
                  ],
                ),
                Expanded(
                  child: Image.asset('images/2.png'),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildDrawer() {
    return Drawer(
        //shape: ShapeBorder.lerp(a, b, t),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildDrawerItem(title: 'Scores', icon: Icons.grade, onClicked: () {}),
        buildDrawerItem(
            title: 'Prize Payout', icon: Icons.local_pizza, onClicked: () {}),
        buildDrawerItem(title: 'Rules', icon: Icons.rule, onClicked: () {}),
        buildDrawerItem(title: 'Support', icon: Icons.grade, onClicked: () {}),
        buildDrawerItem(
            title: 'About', icon: Icons.all_inbox_rounded, onClicked: () {}),
        buildDrawerItem(
            title: 'Buy Our Book', icon: Icons.book, onClicked: () {}),
        buildDrawerItem(
            title: 'Sign Out', icon: Icons.sign_language, onClicked: () {})
      ],
    ));
  }

  Widget buildDrawerItem(
      {String? title, IconData? icon, VoidCallback? onClicked}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ListTile(
        onTap: onClicked,
        title: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.red,
            ),
            SizedBox(width: 40),
            Text(title!, style: TextStyle(color: Colors.red, fontSize: 20)),
          ],
        ),
      ),
    );
  }

  Widget buildConatiner(
      {required IconData? icon, required String text, required Color color}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 120,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
      ),
    );
  }
  // itemCount: 4,
  // itemBuilder: (context, index) {
  //   return Container(
  //       child: Column(
  //     children: [
  //       Icon(Icons.leaderboard),
  //       Text('hgjks'),
  //     ],
  //   ));
}
