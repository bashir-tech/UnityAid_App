import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authomethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //signupp
  Future<String> signUpUser({
    required String fullName,
    required String email,
    required String password,
    required String tel,
    required String adress,
  }) async {
    String res = "Error occured";
    try {
      if (fullName.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty ||
          tel.isNotEmpty ||
          adress.isNotEmpty) {
        //register
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // add user to the database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'fullname': fullName,
          'email': email,
          'password': password,
          'tel': tel,
          'adress': adress,
        });

        // adding user in our database
        await _firestore.collection("users").doc(cred.user!.uid);

        res = "success";
        // anotherway
        /* await _firestore.collection('users').add({

            'fullname': fullName,
          'email': email,
          'password': password,
          'tel': tel,
          'adress': adress,
        });*/
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  // login user

// logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}
