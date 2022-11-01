import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String name = '';
  String phone = '';
  DateTime? dob;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.search), Icon(Icons.search)],
        title: Text("Whatsapp"),
      ),
      body: Column(
        children: [
          TextFormField(
            onChanged: (val) {
              name = val;
            },
          ),
          TextFormField(
            onChanged: (val) {
              phone = val;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                suffix: IconButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: dob ?? DateTime.now(),
                        firstDate: DateTime(2010),
                        lastDate: DateTime(2030),
                      ).then((value) {
                        dob = value;
                      });
                    },
                    icon: Icon(Icons.calendar_month))),
          ),
          ElevatedButton(
              onPressed: () {
                print(name);
                print(phone);
                print(dob.toString());
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
