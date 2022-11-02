import 'package:flutter/material.dart';
import 'package:flutter_exam/pages/widgets/button.dart';
import 'package:flutter_exam/pages/description/description_page.dart';
import 'package:flutter_exam/pages/description/description_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildPage({title, description, imageUrl, color}) {
  return Padding(
    padding: const EdgeInsets.only(top: 60, left: 33, right: 30, bottom: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 28,
                color: color,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              description,
              style: const TextStyle(
                  fontSize: 22, color: Color.fromARGB(255, 108, 106, 106)),
            ),
          ],
        ),
        Image.asset(imageUrl),
        Consumer<DescriptionPageProvider>(
          builder: (context, value, child) => value.currentIndex == 3
              ? buttonWidget(value, context, text: 'Go to Homepage', color: Colors.purple)
              : AnimatedSmoothIndicator(
                  activeIndex: value.currentIndex,
                  count: pages.length,
                  effect: const WormEffect(
                    dotHeight: 16,
                    dotWidth: 16,
                    type: WormType.thin,
                  ),
                  onDotClicked: (index) => value.onChangePage(index),
                ),
        )
      ],
    ),
  );
}
