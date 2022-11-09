import 'package:flutter/material.dart';

Widget buttonWidget(callback, {text, color}) {
  return ElevatedButton(
    onPressed: () {
      callback();
    },
    child: Text(
      text,
      style: const TextStyle(fontSize: 18),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      )),
    ),
  );
}
