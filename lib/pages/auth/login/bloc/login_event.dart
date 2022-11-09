part of 'login_bloc.dart';

abstract class LoginPageEvent extends Equatable {
  const LoginPageEvent();

  @override
  List<Object> get props => [];
}

class OnShowPassword extends LoginPageEvent {}

class OnChangeCheckBox extends LoginPageEvent {
  final bool value;
  const OnChangeCheckBox(this.value);
}
