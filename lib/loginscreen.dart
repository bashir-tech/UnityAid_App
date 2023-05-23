import 'package:flutter/material.dart';
import 'MainScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return __LoginScreen();
  }
}
class __LoginScreen extends State<LoginScreen> {
  String? username;
  String? password;
  String message = '';

  void checkPassword() {
    if (username?.isNotEmpty == true && password?.isNotEmpty == true) {
      if (username == 'bashka' && password == 'bash') {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        });
      } else {
        setState(() {
          message = 'Hatali Giriş. Tekrar Dene';
        });
      }
    } else {
      setState(() {
        message = ' Boş birakazsin.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000116),
      appBar: AppBar(
        title: const Text(
          "Giriş Sayfa",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 239, 242, 243),
          ),
        ),
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                child: Image.asset(
                  "assets/img/screen.png",
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: 300,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Email",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: 300,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true, // Make password hidden
                decoration: InputDecoration(
                  hintText: "Password",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 150,
              child: ElevatedButton(
                onPressed: checkPassword,
                child: Text(
                  'Giriş Yap',
                  style: TextStyle(color: Colors.black87),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                  backgroundColor: Color.fromARGB(255, 235, 234, 234),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  shadowColor: Colors.amber,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
