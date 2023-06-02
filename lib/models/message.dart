import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  String messages = "";
  String sender = "";
  String address = "";
  List<QueryDocumentSnapshot> documents = [];
  @override
  void initState() {
    super.initState();
    mess();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      child: Scaffold(
          appBar: AppBar(
            title: Text("messages"),
            centerTitle: true,
            actions: [],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 500,
                  width: 300,
                  child: Center(child: mess()),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 300),
                  child: Container(
                    child: TextButton.icon(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                      label: Text('Clear'),
                      onPressed: clearMessages,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget mess() {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('messages')
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

          return Container(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  String message = documents[index].get('message');
                  String sender = documents[index].get('sender');
                  String address = documents[index].get('address');

                  return Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'yardim isteyen: $sender',
                          style: TextStyle(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 6, 6, 6),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Address: $address',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 215, 145, 34),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }

  void clearMessages() {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserId)
        .collection('messages')
        .get()
        .then((snapshot) {
      for (DocumentSnapshot doc in snapshot.docs) {
        doc.reference.delete();
      }
      setState(() {
        documents = [];
      });
    });
  }
}
