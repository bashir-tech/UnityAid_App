import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000116),
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Color(0xFF000116),
        centerTitle: true,
      ),
    );
  }
}
