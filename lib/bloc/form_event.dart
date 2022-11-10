part of 'form_bloc.dart';

@immutable
abstract class FormPageEvent {}

//class OnShowPassword extends FormPageEvent {}

class OnAddFormGroupEvent extends FormPageEvent {
  FormGroup? form;
  OnAddFormGroupEvent(this.form);
}
