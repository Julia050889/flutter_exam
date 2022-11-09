import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/base/route.dart';
import 'package:flutter_exam/pages/auth/login/login_styles.dart';
import 'package:flutter_exam/pages/description/bloc/description_bloc.dart';
import 'package:flutter_exam/pages/description/widgets/build_page.dart';
import 'package:flutter_exam/pages/widgets/button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    return BlocProvider(
      create: (context) => DescriptionBloc(),
      child: Scaffold(
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return BlocBuilder<DescriptionBloc, DescriptionState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Stack(children: [
          PageView.builder(
            controller: state.controller,
            scrollDirection: Axis.horizontal,
            itemCount: pages.length,
            onPageChanged: (value) => BlocProvider.of<DescriptionBloc>(context)
                .add(OnChangeIndex(value)),
            itemBuilder: ((context, index) => pages[index]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlocBuilder<DescriptionBloc, DescriptionState>(
              builder: (context, state) => state.currentIndex == pages.length - 1
                  ? buttonWidget(() {
                      onNavigate(context);
                    }, text: 'Go to Homepage', color: Colors.purple)
                  : AnimatedSmoothIndicator(
                      activeIndex: state.currentIndex,
                      count: pages.length,
                      effect: const WormEffect(
                        dotHeight: 16,
                        dotWidth: 16,
                        type: WormType.thin,
                      ),
                      onDotClicked: (index) => state.controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeIn),
                    ),
            ),
          )
        ]),
      ),
    );
  }

  onNavigate(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.homepage);
  }
}
