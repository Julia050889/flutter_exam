import 'package:flutter/material.dart';

Widget checkBoxField(provider) {
  return CheckboxListTile(
    value: provider.checkedValue,
    title: const Text('Remember password'),
    activeColor: Colors.red,
    onChanged: (value) => provider.onChangeCheckBox(value),
    controlAffinity: ListTileControlAffinity.leading,
  );
}
