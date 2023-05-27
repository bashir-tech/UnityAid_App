import 'package:flutter/material.dart';
import 'package:loging_page/models/myLocation.dart';

import '../models/myProfile.dart';
import '../utils/custombutton.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF000116),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 5, 8, 26),
          title: Text('AnaSayfa'),
          actions: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: IconButton(
                    icon: Icon(Icons.person, size: 35),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyProfile()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/img/back.png', // Replace with your image path
                width: 200,
                colorBlendMode: BlendMode.colorDodge,
              ),
              const SizedBox(height: 10),
              const Text(
                "Bir El Uzat, Bir Fark Yarat!",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 60),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(children: [
                  CustomButton(
                    icon: Icons.help_outline,
                    text: "Yardim Iste",
                    onPressed: () {},
                  ),
                ]),
                const SizedBox(width: 100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      icon: Icons.mic,
                      text: "Mikrofonu Aç",
                      onPressed: () {
                        // Handle Yardim Iste button click
                        print("Yardim Iste button clicked");
                      },
                    ),
                  ],
                ),
              ]),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    CustomButton(
                      icon: Icons.help,
                      text: "Yardim Istekleri",
                      onPressed: () {
                        // Handle Yardim Iste button click
                        print("Yardim Iste button clicked");
                      },
                    ),
                  ]),
                  const SizedBox(width: 100),
                  Column(children: [
                    CustomButton(
                      icon: Icons.location_on,
                      text: "Konumu Aç",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyLocation()),
                        );
                      },
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ));
  }
}
