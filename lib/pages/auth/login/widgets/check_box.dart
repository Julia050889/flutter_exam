import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/pages/auth/login/bloc/login_bloc.dart';

Widget checkBoxField(BuildContext context) {
  return BlocBuilder<LoginPageBloc, LoginPageState>(
    builder: (context, state) {
      return CheckboxListTile(
        value: state.checkValue,
        title: const Text('Remember password'),
        activeColor: Colors.red,
        onChanged: (value) {
          BlocProvider.of<LoginPageBloc>(context).add(OnChangeCheckBox(value!));
          //context.read<LoginPageBloc>().add(OnChangeCheckBox(state));
        },
        controlAffinity: ListTileControlAffinity.leading,
      );
    },
  );
}
