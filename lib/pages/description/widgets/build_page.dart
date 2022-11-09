import 'package:flutter/material.dart';

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
      ],
    ),
  );
}
