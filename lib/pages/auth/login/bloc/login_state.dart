part of 'login_bloc.dart';

class LoginPageState extends Equatable {
  final bool showPassword;
  final bool checkValue;

  LoginPageState({
    this.showPassword = true,
    this.checkValue = true,
  });

  LoginPageState copyWith({
    bool? showPassword,
    bool? checkValue,
  }) {
    return LoginPageState(
      showPassword: showPassword ?? this.showPassword,
      checkValue: checkValue ?? this.checkValue,
    );
  }

  @override
  List<Object?> get props => [
        showPassword,
        checkValue,
      ];
}
