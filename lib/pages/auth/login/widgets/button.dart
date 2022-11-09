import 'package:flutter/material.dart';
import 'package:flutter_exam/base/route.dart';
import 'package:flutter_exam/pages/auth/login/widgets/field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SubmitButton extends StatelessWidget {
  String text;
  Color color;
  SubmitButton({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ReactiveForm.of(context)!.valid
            ? Navigator.pushReplacementNamed(context, AppRoutes.description)
            : form.markAllAsTouched();
      },
      child: Text(text),
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
}
