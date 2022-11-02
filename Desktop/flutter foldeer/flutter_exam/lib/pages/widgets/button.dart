import 'package:flutter/material.dart';

Widget buttonWidget(provider, context, {text, color}) {
  return ElevatedButton(
    onPressed: () {
      provider.onLogin(context);
    },
    child: Text(
      text,
      style: const TextStyle(fontSize: 18),
    ),
    style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        )),
        primary: color),
  );
}
