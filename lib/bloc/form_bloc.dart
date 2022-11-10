import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/form.dart';

import 'package:reactive_forms/reactive_forms.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormPageBloc extends Bloc<FormPageEvent, FormPageState> {
  FormPageBloc() : super(FormPageState(array: FormArray([group]))) {
    on<OnAddFormGroupEvent>(((event, emit) {
      state.array.add(event.form as FormGroup);
      emit(state.copyWith());
    }));
    // on<OnShowPassword>((event, emit) {
    //   emit(state.copyWith(showPassword: !state.showPassword));
    // });
  }
}
