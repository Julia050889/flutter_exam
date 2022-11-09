import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';

final form = FormArray([
  FormGroup({
    'relationship': FormControl<String>(value: ''),
    'position': FormControl<String>(),
    'note': FormControl<String>(),
  })
]);

class FormArrayPage extends StatelessWidget {
  const FormArrayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Array'),
        centerTitle: true,
      ),
      body: buildForm(),
    );
  }

  Widget buildForm() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Relationship',
                style: TextStyle(color: Colors.red, fontSize: 25)),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: IconButton(
                onPressed: () {
                  form.add(FormGroup({
                    'position': FormControl<String>(),
                    'relationship': FormControl<String>(),
                    'note': FormControl(),
                  }));
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
            formArray: form,
            builder: (context, formArray, child) => Expanded(
                  child: ListView.builder(
                      itemCount: form.controls.length,
                      itemBuilder: (context, index) {
                        return buildItem(form.controls[index]);
                      }),
                )),
      ]),
    );
  }

  Widget buildItem(formArray) {
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
                  child: ReactiveTextField(formControlName: 'position'),
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
                onPressed: () {},
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
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.close)),
                          const Text('Cancel'),
                        ],
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text('Save'),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
