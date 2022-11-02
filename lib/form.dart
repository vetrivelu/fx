import 'package:flutter/material.dart';
import 'package:fx/firestore.dart';
import 'package:fx/profile.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  var name = TextEditingController();
  var phone = TextEditingController();
  var date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Form"),
      ),
      body: Form(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: date,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Date of Birth',
                suffix: IconButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2025),
                    ).then((value) {
                      if (value != null) {
                        date.text = value.toString().substring(0, 10);
                      }
                    });
                  },
                  icon: const Icon(Icons.calendar_month),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Phone Number',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
                width: double.maxFinite,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {
                      var object = {
                        'name': name.text,
                        'dob': date.text,
                        'phone': phone.text,
                      };
                      var profile = Profile.fromJson(object);
                      profile.add();
                    },
                    child: const Text("Submit"))),
          )
        ],
      )),
    );
  }
}
