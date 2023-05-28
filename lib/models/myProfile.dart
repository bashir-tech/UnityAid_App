import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String tel = "";
  String fullName = "";
  String email = "";
  String adress = "";
  @override
  void initState() {
    super.initState();
    getfullname();
  }

  void getfullname() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
        fullName = (snap.data() as Map<String, dynamic>)["fullName"];
      
      email = (snap.data() as Map<String, dynamic>)["email"];
      tel = (snap.data() as Map<String, dynamic>)["tel"];
      adress = (snap.data() as Map<String, dynamic>)["adress"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF000116),
        appBar: AppBar(
          title: Text("$fullName"),
          backgroundColor: Color(0xFF000116),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
             
                SizedBox(height: 30),
              fullNameFormField("$fullName"),
              SizedBox(height: 30),
                EmailFormField("$email"),
                     SizedBox(height: 30),
                TelFormField("$tel"),
                     SizedBox(height: 30),
                AdressFormField("$adress")
            ],
          ),
        ));
  }

 TextEditingController _fullNameController = TextEditingController();
 TextEditingController _adressController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
   TextEditingController _telControlller = TextEditingController();
TextFormField fullNameFormField(String fullname) {
  _fullNameController.text = fullname; // Set the initial value using the controller
  return TextFormField(
    style: const TextStyle(color: Color.fromARGB(255, 5, 3, 3)),
    decoration: customInputDecoration("Enter your full name"),
    controller: _fullNameController, // Use the controller to manage the field's value
  );
}

TextFormField EmailFormField(String email) {
  _emailController.text = email;
  return TextFormField(
    style: const TextStyle(color: Color.fromARGB(255, 5, 3, 3)),
    decoration: customInputDecoration("Enter your email"),
    controller: _emailController,
     
  );
}
TextFormField TelFormField(String tel ){
  _telControlller.text = tel; // Set the initial value using the controller
  return TextFormField(
    style: const TextStyle(color: Color.fromARGB(255, 5, 3, 3)),
    decoration: customInputDecoration("Enter your number"),
    controller: _telControlller, // Use the controller to manage the field's value
  );
}
TextFormField AdressFormField(String address) {
  _adressController.text = address; // Set the initial value using the controller
  return TextFormField(
    style: const TextStyle(color: Color.fromARGB(255, 5, 3, 3)),
    decoration: customInputDecoration("Enter your Adress"),
    controller: _adressController, // Use the controller to manage the field's value
  );
}




InputDecoration customInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(
      color: Colors.grey,
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    ),
    filled: true,  // Add this line to enable filling the field
    fillColor: Colors.white,  // Set the fill color for the field
  );
}


}





/*

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loging_page/utils/snackbar.dart';

class MyProfile extends StatefulWidget {
  final String uid;
  const MyProfile({Key? key, required this.uid}) : super(key: key);
  @override
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  var userData = {};
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
   var snap=  await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();
          userData = snap.data()!;
          setState(() {
            

          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF000116),
        appBar: AppBar(
          title:  Text( userData['email'],),
          backgroundColor: Color(0xFF000116),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            "profile",
         
            style: const TextStyle(color: Colors.white, fontSize: 50),
          ),
        ));
  }
}
*/
