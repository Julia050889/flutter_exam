import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/pages/auth/login/bloc/login_bloc.dart';
import 'package:flutter_exam/pages/auth/login/login_styles.dart';
import 'package:flutter_exam/pages/auth/login/widgets/button.dart';
import 'package:flutter_exam/pages/auth/login/widgets/check_box.dart';
import 'package:reactive_forms/reactive_forms.dart';

const password =
    r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";

final form = FormGroup({
  'email':
      FormControl<String>(validators: [Validators.required, Validators.email]),
  'password': FormControl<String>(
      validators: [Validators.required, Validators.pattern(password)]),
});

Widget field(BuildContext context, LoginPageState state) {
  return ReactiveForm(
    formGroup: form,
    child: Column(
      children: [
        ReactiveTextField(
          formControlName: 'email',
          decoration: const InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: LoginStyles.mainColor),
            ),
            hintText: 'Email',
            focusColor: LoginStyles.mainColor,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ReactiveTextField(
          formControlName: 'password',
          obscureText: !state.showPassword,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: LoginStyles.mainColor),
            ),
            hintText: 'Password',
            suffixIcon: IconButton(
              onPressed: () {
                context.read<LoginPageBloc>().add(OnShowPassword());
              },
              icon: !state.showPassword
                  ? const Icon(
                      Icons.visibility,
                      color: LoginStyles.mainColor,
                    )
                  : const Icon(
                      Icons.visibility_off,
                      color: LoginStyles.mainColor,
                    ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        checkBoxField(context),
        const SizedBox(
          height: 25,
        ),
        SubmitButton(text: 'Login', color: LoginStyles.mainColor),
      ],
    ),
  );
}
