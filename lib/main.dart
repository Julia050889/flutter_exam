import 'package:flutter/material.dart';
import 'package:quiz_flutter/form_page.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_image_picker/image_file.dart';

void main() {
  runApp(const MyApp());
}

const pattern = r"^(?=.*[a-z]).{8,32}$";

final form = FormGroup({
  'personal': FormGroup({
    'name': FormControl<String>(value: '', validators: [Validators.required]),
  }),
  'datePicker': FormGroup({
    'date': FormControl<DateTime>(),
    'expiredate': FormControl<DateTime>(),
  }),
  'password': FormControl<String>(validators: [Validators.pattern(pattern)]),
  'confirmpassword': FormControl<String>(),
  'switch': FormControl<bool>(value: true),
  'radio': FormControl(),
  'radio2': FormControl(),
  'days': FormControl<int>(validators: [Validators.number]),
  'currency': FormControl<List<String>>(value: ['AED', 'AMD']),
  'contact': FormControl<String>(value: 'John Doe'),
  'input': FormControl<ImageFile>()
}, validators: [
  Validators.mustMatch('password', 'confirmpassword')
]);

// final form = FormGroup({
//   'name': FormControl<String>(value: '', validators: [Validators.required]),
//   'date': FormControl<DateTime>(),
//   'expiredate': FormControl<DateTime>(),
//   'days': FormControl<int>(
//     validators: [Validators.number],
//   ),
//   'currency': FormControl<String>(value: r'$'),
//   'contact': FormControl<String>(value: 'John Doe'),
// });

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form page',
      home: FormPage(),
    );
  }
}
