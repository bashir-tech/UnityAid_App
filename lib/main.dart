import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loging_page/models/myLocation.dart';
import 'package:loging_page/models/myProfile.dart';
import 'dart:ui';
import 'firebase_options.dart';
import 'pages/loginscreen.dart';
import 'pages/mainscreen.dart';
import 'pages/signupscreen.dart';
import 'pages/welcomescreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/loginscreen": (context) => LoginScreen(),
        "/mainscreen": (context) => MainScreen(),
        "/MainScreen": (context) => MainScreen(),
        "/signupscreen": (context) => SignUpScreen(),
        "/welcomescreen": (context) => WelcomeScreen(),
        "/myLocation": (context) => MyLocation(),
        "/myProfile": (context) => MyProfile(),
      },
      home: WelcomeScreen(),
    );
  }
}
