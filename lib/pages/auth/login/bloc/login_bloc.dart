import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc() : super(LoginPageState()) {
    on<OnShowPassword>((event, emit) {
      emit(state.copyWith(showPassword: !state.showPassword));
    });
    on<OnChangeCheckBox>((event, emit) {
      emit(state.copyWith(checkValue: event.value));
    });
  }
}
