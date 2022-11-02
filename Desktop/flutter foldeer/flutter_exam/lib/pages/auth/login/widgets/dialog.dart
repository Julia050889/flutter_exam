import 'package:flutter/material.dart';

Widget dialog(BuildContext context, {title, content}) {
  return AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      TextButton(onPressed: (() => Navigator.pop(context)), child: Text('OK'))
    ],
  );
}
