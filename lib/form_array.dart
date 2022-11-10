import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/bloc/form_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';

var myList = [];

class FormArrayPage extends StatelessWidget {
  const FormArrayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FormPageBloc>(
      create: (context) => FormPageBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form Array'),
          centerTitle: true,
        ),
        body: buildForm(),
      ),
    );
  }

  Widget buildForm() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<FormPageBloc, FormPageState>(
        builder: (context, state) {
          return Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Relationship'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: IconButton(
                    onPressed: () {
                      context.read<FormPageBloc>().add(
                            OnAddFormGroupEvent(
                              FormGroup(
                                {
                                  'relationship': FormControl<String>(),
                                  'note': FormControl<String>(),
                                  'position': FormControl<String>()
                                },
                              ),
                            ),
                          );
                    },
                    icon: const Icon(Icons.add),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ReactiveFormArray(
                formArray: state.array,
                builder: (context, formArray, child) {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: state.array.controls.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: Key(state.array.controls.toString()),
                              onDismissed: (direction) {
                                formArray.removeAt(index);
                              },
                              child: buildItem(state.array.controls[index],
                                  index),
                            );
                          }));
                })
          ]);
        },
      ),
    );
  }

  Widget buildItem(formArray, ind) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 235, 235, 232)),
      child: ReactiveForm(
        formGroup: formArray,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ReactiveDropdownSearch<String, String>(
                    formControlName: 'relationship',
                    items: const ['jksgxcb', 'jksbxkjb', 'hjxvjch'],
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: 'Relationship',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ReactiveTextField(
                    formControlName: 'position',
                    decoration: const InputDecoration(labelText: 'Position'),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ReactiveTextField(
              formControlName: 'note',
              decoration: const InputDecoration(labelText: 'Note'),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(
                icon: const Icon(
                  Icons.delete,
                ),
                onPressed: () {
                  formArray.parent.removeAt(ind);
                },
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              formArray.reset();
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                                const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                      padding: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              myList.add(formArray.value);
                              print(myList);
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.done,
                                  color: Colors.grey,
                                ),
                                const Text(
                                  'Save',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
