import 'package:flutter/material.dart';

import 'signupscreen.dart';
import 'welcomescreen.dart';
import 'package:google_fonts/src/asset_manifest.dart';
import 'package:google_fonts/src/asset_manifest.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      home:   WelcomeScreen(),
    );
  }
}

class deneme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      home: Scaffold(
        body: Text("data"),
      ),
    );
  }
}
