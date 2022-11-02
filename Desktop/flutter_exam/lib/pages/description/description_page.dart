import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_exam/pages/auth/login/login_styles.dart';
import 'package:flutter_exam/pages/description/description_provider.dart';
import 'package:flutter_exam/pages/description/widgets/build_page.dart';
import 'package:provider/provider.dart';

List pages = [
  buildPage(
    title: 'Game Play',
    description:
        'You will receive 5 free plays a day and you can purchase additional plays that never expire. Questions are progressive, increasing in difficulty and value from easy to hard and 1 to 10 points',
    imageUrl: 'images/description_page/1.png',
    color: LoginStyles.mainColor,
  ),
  buildPage(
    title: 'Score',
    description:
        'If you answer all the questions in less than 60 seconds, then your remaining time is a multiplier against your question points. But be careful: wrong answers decrease your time multiplier.',
    imageUrl: 'images/description_page/2.png',
    color: Colors.green,
  ),
  buildPage(
    title: 'LeaderBoard',
    description:
        'Your best score during each 24 hour game period will appear on the Leaderboard. The highest eligible score each day will be the winner of the cash prize. Each day\'s prize pool will increase \$0.01 for each game played, but we will guarantee the first \$100.00.',
    imageUrl: 'images/description_page/3.png',
    color: Colors.orange,
  ),
  buildPage(
    title: 'Claim Prize',
    description:
        'If you\'re good enough to achieve a winning score, then you\'ll win the cash prize pool for the day. Go to the Claim Prize screen and send us your info and we will transfer your winnings to your PayPal account. Note: you can only win once every 30 days.',
    imageUrl: 'images/description_page/4.png',
    color: const Color.fromARGB(255, 53, 4, 63),
  )
];

class DescriptionPageWidget extends StatelessWidget {
  const DescriptionPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DescriptionPageProvider>(
      create: (context) => DescriptionPageProvider(),
      child: Scaffold(
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return Consumer<DescriptionPageProvider>(
      builder: (context, provider, child) => PageView.builder(
        controller: provider.controller,
        scrollDirection: Axis.horizontal,
        itemCount: pages.length,
        onPageChanged: (value) => provider.onChangeIndex(value),
        itemBuilder: ((context, index) => pages[index]),
      ),
     
    );
  }
}
