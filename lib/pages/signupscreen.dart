import 'package:flutter/material.dart';

import '../service/autho_method.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _signUpScreenState();
  }
}

class _signUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _fullnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _telController.dispose();
    _addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000116),
      appBar: AppBar(
        title: const Text(
          "Üye Ol",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 239, 242, 243),
          ),
        ),
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    child: Image.asset(
                      "assets/img/screen.png",
                      width: 200,
                      height: 150,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      forfullname(),
                      const SizedBox(height: 20),
                      fortel(),
                      const SizedBox(height: 20),
                      foremail(),
                      const SizedBox(height: 20),
                      forpass(),
                      const SizedBox(height: 20),
                      foradress(),
                      const SizedBox(height: 20),
                      kaydet(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField forfullname() {
    return TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: _fullnameController,
        decoration: customInputDecoration("FullName"));
  }

  TextFormField fortel() {
    return TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: _telController,
        decoration: customInputDecoration("Telphone"));
  }

  TextFormField foremail() {
    return TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: _emailController,
        decoration: customInputDecoration("Email"));
  }

  TextFormField forpass() {
    return TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: _passwordController,
        decoration: customInputDecoration("Password"));
  }

  TextFormField foradress() {
    return TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: _addressController,
        decoration: customInputDecoration("Adresss"));
  }

  Widget kaydet() {
    return Container(
      height: 60,
      width: 150,
      child: ElevatedButton(
        onPressed: () async {
          String res = await Authomethod().signUpUser(
            fullName: _fullnameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            tel: _telController.text,
            adress: _addressController.text,
          );
          print(res);
        },
        child: Text(
          'Kaydet',
          style: TextStyle(color: Colors.black87),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          backgroundColor: Color.fromARGB(255, 235, 234, 234),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          shadowColor: Colors.amber,
        ),
      ),
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
    );
  }
}
