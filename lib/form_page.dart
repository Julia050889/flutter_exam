import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/bloc/form_bloc.dart';
import 'package:quiz_flutter/main.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormBloc(),
      child: Scaffold(
        body: Container(
            color: const Color.fromARGB(225, 253, 251, 251),
            child: buildForm()),
      ),
    );
  }
}

Widget buildForm() {
  return SingleChildScrollView(
    child: Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(237, 245, 239, 239),
        borderRadius: BorderRadius.circular(10),
      ),
      child: BlocBuilder<FormBloc, FormPageState>(
        builder: (context, state) {
          return ReactiveForm(
            formGroup: form,
            child: Column(children: [
              ReactiveTextField(
                formControlName: 'personal.name',
                // textInputAction: TextInputAction.next,
                validationMessages: {
                  'required': (error) => 'The name must not be empty'
                },
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  labelText: 'Title',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ReactiveDateTimePicker(
                      formControlName: 'datePicker.date',
                      decoration: const InputDecoration(
                        labelText: 'Date',
                        // helperText: '',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ReactiveDateTimePicker(
                      formControlName: 'datePicker.expiredate',
                      decoration: const InputDecoration(
                        labelText: 'Expiry date',
                        // helperText: '',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'days',
                      // textInputAction: TextInputAction.next,
                      // onSubmitted: () => form.focus('currency'),
                      validationMessages: {
                        'number': (error) => 'Days must be number'
                      },
                      decoration: const InputDecoration(
                        labelText: 'Days',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ReactiveDropdownSearchMultiSelection<String, String>(
                      formControlName: 'currency',
                      popupProps: PopupPropsMultiSelection.menu(
                        showSelectedItems: true,
                        disabledItemFn: (s) {
                          return s.startsWith('A');
                        },
                      ),
                      items: ['AMD', 'GSP', '\$', 'CHF', 'AED'],
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                        labelText: 'Currency',
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              ReactiveDropdownSearch<String, String>(
                formControlName: 'contact',
                popupProps: const PopupProps.menu(
                  showSelectedItems: true,
                ),
                items: const [
                  'John Doe',
                  'Julia Khlghatyn',
                  'Armenuhi Toroyan',
                  'Grigory Grigoryan'
                ],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: 'Contact',
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ReactiveTextField(
                formControlName: 'password',
                validationMessages: {
                  'pattern': (error) =>
                      'Field must be uppercase and lowercase letters, characters',
                },
                decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<FormBloc>(context)
                              .add(OnShowPassword());
                        },
                        icon: state.showPassword
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility))),
                obscureText: !state.showPassword,
              ),
              ReactiveTextField(
                formControlName: 'confirmpassword',
                decoration:
                    const InputDecoration(labelText: 'Confirm password'),
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              // ReactiveCheckboxListTile(
              //   formControlName: 'switch',
              //   activeColor: Colors.red,
              //   checkColor: Colors.green,
              //   title: const Text('Remember'),
              //   subtitle: const Text('Ok'),
              // ),
              // ReactiveImagePicker(
              //   formControlName: 'input',
              // ),
              // ReactiveRadioListTile(
              //   value: false,
              //   title: const Text('Jony'),
              //   formControlName: 'radio',
              // ),
              // ReactiveRadioListTile(
              //   value: false,
              //   title: const Text('Jack'),
              //   formControlName: 'radio2',
              // ),
              const SizedBox(
                height: 40,
              ),
              const MySubmitButton(),
            ]),
          );
        },
      ),
    ),
  );
}

class MySubmitButton extends StatelessWidget {
  const MySubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          ReactiveForm.of(context)!.valid
              ? print('OK')
              : form.markAllAsTouched();
        },
        child: const Text('Submit'));
  }
}
