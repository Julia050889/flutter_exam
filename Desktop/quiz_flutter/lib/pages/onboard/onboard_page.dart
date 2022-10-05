import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_flutter/pages/home/home_provider.dart';
import 'package:quiz_flutter/pages/onboard/onboard_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:circle_indicator/circle_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnBoardingProvider>(
        create: ((context) => OnBoardingProvider()),
        child: Scaffold(
            body: Consumer<OnBoardingProvider>(
                builder: (context, provider, child) => PageView(
                      controller: provider.controller,
                      onPageChanged: (value) => provider.onChangeIndex(value),
                      children: [
                        buildPage(
                          title: 'Game Play',
                          description:
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                          imageUrl: 'images/2.png',
                        ),
                        buildPage(
                          title: 'Score',
                          description:
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                          imageUrl: 'images/3.png',
                        ),
                        buildPage(
                          title: 'LeaderBoard',
                          description:
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                          imageUrl: 'images/4.png',
                        ),
                        Column(
                          children: [
                            buildPage(
                              title: 'Claim Prize',
                              description:
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                              imageUrl: 'images/5.png',
                            ),
                            buildButton(context),
                          ],
                        ),
                      ],
                      //buildIndicator(value),
                    ))));
  }

  Widget buildButton(BuildContext context) {
    return Consumer<OnBoardingProvider>(
      builder: (context, value, child) => ElevatedButton(
        onPressed: () {
          value.onChangePage(context);
        },
        child: const Text('Go to homepage', style: TextStyle(fontSize: 20)),
        style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )),
            primary: Colors.purple),
      ),
    );

    // Widget buildIndicator(provider) {
    //   return AnimatedSmoothIndicator(
    //     activeIndex: provider.activeIndex,
    //     count: 4,
    //     effect: const ScrollingDotsEffect(),
    //     onDotClicked: activeDot(provider),
    //   );
    // }

    // void activeDot(provider) {

    //   provider.controller.animateToPage();
    // }
  }

  Widget buildPage({
    required String title,
    required String description,
    required String imageUrl,
  }) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 30),
        child: Column(
          children: [
            Text(title,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                )),
            SizedBox(
              height: 15,
            ),
            Text(description),
            Image.asset(imageUrl),
          ],
        ));
  }
}
