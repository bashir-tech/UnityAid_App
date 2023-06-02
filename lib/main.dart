import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:loging_page/models/myLocation.dart';
import 'package:loging_page/models/myProfile.dart';
import 'package:loging_page/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'models/nearbyUser.dart';
import 'models/message.dart';
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
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProviders())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/loginscreen": (context) => LoginScreen(),
          "/mainscreen": (context) => MainScreen(),
          "/MainScreen": (context) => MainScreen(),
          "/signupscreen": (context) => SignUpScreen(),
          "/welcomescreen": (context) => WelcomeScreen(),
          "/myLocation": (context) => MyLocation(),
          "/myProfile": (context) => MyProfile(
                // uid: FirebaseAuth.instance.currentUser!.uid,
              ),
                // "/get": (context) => MyApp(),
                  "/message": (context) => Messages(),
        },
        home: WelcomeScreen(),
      ),
    );
  }
}
