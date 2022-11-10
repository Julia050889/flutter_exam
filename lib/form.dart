import 'package:reactive_forms/reactive_forms.dart';

final group = FormGroup({
  'relationship': FormControl<String>(value: ''),
  'position': FormControl<String>(),
  'note': FormControl<String>(),
});
