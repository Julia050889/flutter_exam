import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:quiz_flutter/main.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormPageState> {
  FormBloc() : super(FormPageState()) {
    on<OnShowPassword>((event, emit) {
      emit(state.copyWith(showPassword: !state.showPassword));
    });
  }
}
