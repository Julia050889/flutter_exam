import 'package:flutter/material.dart';
import 'package:flutter_exam/base/styles/color.dart';

Widget drawItem({text, image}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: ListTile(
        title: Row(
      children: [
        image,
        const SizedBox(
          width: 30,
        ),
        Text(
          text,
          style: const TextStyle(color: Style.red, fontSize: 24),
        ),
      ],
    )),
  );
}
