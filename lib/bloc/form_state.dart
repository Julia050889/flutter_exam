part of 'form_bloc.dart';

// class FormPageState extends Equatable {
//   bool showPassword;

//   FormPageState({this.showPassword = false});

//   FormPageState copyWith({bool? showPassword}) {
//     return FormPageState(
//       showPassword: showPassword ?? this.showPassword,
//     );
//   }

//   @override
//   // TODO: implement props
//   List<Object?> get props => [showPassword];
// }

class FormPageState extends Equatable {
  final FormArray array;
  //final FormGroup group;

  const FormPageState({required this.array});

  FormPageState copyWith({FormArray? array, FormGroup? group}) {
    return FormPageState(array: array ?? this.array);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [array];
}
