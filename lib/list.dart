import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fx/firestore.dart';
import 'package:fx/form.dart';
import 'package:fx/profile.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return MyForm();
          }));
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: profileRef.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
              var objects = [];
              objects = snapshot.data!.docs.map((e) => e.data()).toList();
              return ListView.builder(
                  itemCount: objects.length,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var object = objects[index];
                    return ListTile(
                      title: Text(object["name"].toString()),
                      subtitle: Text("${object["phone"]}  \n${object["dob"]}"),
                      isThreeLine: true,
                    );
                  });
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
