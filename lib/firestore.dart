import 'package:cloud_firestore/cloud_firestore.dart';

final profileRef = FirebaseFirestore.instance.collection("profiles");

class Profile {
  String name;
  String dob;
  String phone;

  Profile({
    required this.name,
    required this.dob,
    required this.phone,
  });

  add() {
    profileRef.add({
      'name': name,
      'dob': dob,
      'phone': phone,
    });
  }

  factory Profile.fromJson(json) {
    return Profile(
      name: json["name"],
      dob: json["dob"],
      phone: json['phone'],
    );
  }
}
