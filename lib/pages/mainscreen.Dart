import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:loging_page/models/myLocation.dart';
import 'package:just_audio/just_audio.dart';

import '../models/myProfile.dart';
import '../models/nearbyUser.dart';
import '../models/message.dart';
import '../models/user.dart';
import '../utils/custombutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreen();
}


class _MainScreen extends State<MainScreen>{
  final _player = AudioPlayer();
   late Users nearestUser;
  late List<Users> users = [];

 @override
  void initState() {
    super.initState();
   
  }
 
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
                    onPressed: () async {
                  getAllUsers();
                sendMessageToNearestUser();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MyApp()),
                      // );
                    },
                  ),
                ]),
                const SizedBox(width: 100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      icon: Icons.mic,
                      text: "Mikrofonu Aç",
                      onPressed: () async {
                        _player.setVolume(50);
                        final duration = await _player.setUrl(
                            "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3");

                        await _player.play();
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
                        Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) => Messages()),
                        );
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


 void getAllUsers() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    List<DocumentSnapshot> documents = querySnapshot.docs;

    users = documents.map((doc) {
      var snapshot = doc.data() as Map<String, dynamic>;

      return Users(
        fullName: snapshot["fullName"] ?? "",
        email: snapshot["email"] ?? "",
        password: snapshot["password"] ?? "",
        tel: snapshot["tel"] ?? "",
        adress: snapshot["adress"] ?? "",
        lat: snapshot["lat"] ?? 0,
        long: snapshot["long"] ?? 0,
      );
    }).toList();

    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    // currentlat = (snap.data() as Map<String, dynamic>)["lat"] ?? 0.0;
    // currentlong = (snap.data() as Map<String, dynamic>)["long"] ?? 0.0;

     nearestUser = Users(
        fullName: (snap.data() as Map<String, dynamic>)["fullName"] ?? "",
        email: (snap.data() as Map<String, dynamic>)["email"] ?? "",
        password: (snap.data() as Map<String, dynamic>)["password"] ?? "",
        tel: (snap.data() as Map<String, dynamic>)["tel"] ?? "",
        adress: (snap.data() as Map<String, dynamic>)["adress"] ?? "",
        lat: (snap.data() as Map<String, dynamic>)["lat"] ?? 0,
        long: (snap.data() as Map<String, dynamic>)["long"] ?? 0);

    double nearestPath = 0;

    for (var user in users) {
      if (user.email != (snap.data() as Map<String, dynamic>)["email"]) {
        double distanceInMeters = Geolocator.distanceBetween(
            nearestUser.lat, nearestUser.long, user.lat, user.long);

        if (nearestPath == 0 || distanceInMeters < nearestPath) {
          nearestPath = distanceInMeters;
          nearestUser = user;
        }

        print("${user.fullName} =>  $distanceInMeters");
        print('------------------');

        // if (distanceInMeters < nearestPath) {
        //   nearestPath = distanceInMeters;
        //   nearestUser = user;
        // }
      }
    }
    print('------------------');
    print('Nearest Path  == $nearestPath');
    print('********************');
    print('En Yakin kisi => ${nearestUser.email}');
    // print(currentUser.email);

    setState(() {});

    // void sendMessageToNearestUser(String userEmail) async {
    // Get the document reference of the nearest user based on their email
    QuerySnapshot querySnapshotWhere = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: nearestUser.email)
        .get();

    // Get the first document from the query result (assuming email is unique)
    DocumentSnapshot userDoc = querySnapshotWhere.docs[0];

    // Get the user's document ID
    String userId = userDoc.id;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('messages')
        .add({
      'sender': (snap.data() as Map<String, dynamic>)["fullName"],
      'address': (snap.data() as Map<String, dynamic>)["adress"],
      'message': 'Acil yardıma ihtiyacı olan bir kişi var  Liütfen yardım edelim.'
    });

    print('Message sent to: ${nearestUser.email}');
    
  }

   void sendMessageToNearestUser() async {
  

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Telabiniz alindi'),
       
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

 }