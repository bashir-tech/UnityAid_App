import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Users {
  final String fullName;
  final String email;
 final String password;

  final String tel;
  final String adress;

  const Users({
    required this.fullName,
    required this.email,
     required this.password,
    required this.tel,
    required this.adress,
  });
  

  static Users fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Users (
      fullName: snapshot["fullName"],
      email: snapshot["email"],
        password: snapshot["password"],
      tel: snapshot["tel"],
      adress: snapshot["adress"],
    );
  }


  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "tel": tel,
        "adress": adress,
      };
}


