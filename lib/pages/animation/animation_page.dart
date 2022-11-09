import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_exam/base/styles/color.dart';
import 'package:flutter_exam/pages/quiz/quiz_page.dart';

final List colorList = [
  Style.orange,
  Style.blue,
  Style.yellow,
  Style.green,
  Style.orange,
  Style.purple,
  Style.green
];
final List textList = ['READY', '5', '4', '3', '2', '1', 'GO!', ''];

class AnimationPageWidget extends StatelessWidget {
  const AnimationPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider.builder(
        itemCount: textList.length,
        itemBuilder: ((context, index, realIndex) =>
            index == textList.length - 1
                ? const QuizPageWidget()
                : Container(
                    color: colorList[index],
                    child: Center(
                        child: Text(
                      textList[index],
                      style: const TextStyle(fontSize: 62, color: Colors.white),
                    )),
                  )),
        options: CarouselOptions(
          pauseAutoPlayInFiniteScroll: true,
          enableInfiniteScroll: false,
          height: double.infinity,
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 1),
          autoPlayAnimationDuration: const Duration(microseconds: 10),
        ),
      ),
    );
  }
}
