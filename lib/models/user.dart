import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String fullName;
  final String email;
  final String password;
  final String tel;
  final String adress;

  const User({
    required this.fullName,
    required this.email,
    required this.password,
    required this.tel,
    required this.adress,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User (
      fullName: snapshot["fullName"],
      email: snapshot["email"],
      password: snapshot["password"],
      tel: snapshot["tel"],
      adress: snapshot["adress"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": fullName,
        "email": email,
        "password": password,
        "tel": tel,
        "adress": adress,
      };
}
