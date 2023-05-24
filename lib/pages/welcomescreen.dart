import 'package:flutter/material.dart';

import './LoginScreen.dart';
import 'signupscreen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  bool showAboutMe = false;

// Function to toggle the visibility of the about information

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000116),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/img/back.png', // Replace with your image path
                width: 200,

                colorBlendMode: BlendMode.colorDodge,
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                  ),
                ),
                child: const Text(
                  "Bir El Uzat, Bir Fark Yarat!",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                    height: 1.5,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Color.fromRGBO(138, 123, 123, 0.247),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                      Shadow(
                        color: Color.fromRGBO(212, 201, 201, 0.247),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add functteionality for the "About" icon
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        Text(
                          'About',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add functionality for the "Menu" icon
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        Text(
                          'Menu',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add functionality for the "Privacy" icon
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.privacy_tip,
                          color: Colors.white,
                        ),
                        Text(
                          'Privacy',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 60,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );
                        },
                        child: const Text(
                          'Sign  Up',
                          style: TextStyle(color: Colors.black87),
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10,),
                            backgroundColor: Color.fromARGB(255, 235, 234, 234),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            shadowColor: Colors.amber),
                      ),
                    ),
                    Container(
                    height: 60,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.black87),
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10,),
                            backgroundColor: Color.fromARGB(255, 235, 234, 234),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            shadowColor:
                                const Color.fromARGB(255, 238, 237, 235)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
