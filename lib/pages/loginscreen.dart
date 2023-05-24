// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loging_page/pages/mainscreen.dart';
import 'package:loging_page/service/autho_method.dart';

import '../utils/snackbar.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() {
    return __LoginScreen();
  }
}

class __LoginScreen extends State<LoginScreen> {
  bool _isloading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  void logInuser() async {
    setState(() {
      _isloading = true;
    });
    String res = await Authomethod().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == "success") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()));
    } else {
      showSnackBar(context, res);
    }
    setState(() {
      _isloading = false;
    });
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                child: Column(
                  children: [
                    emailTextField(),
                    const SizedBox(height: 50),
                    passwordTextField(),
                    const SizedBox(height: 30),
                    signInButton(),
                    const SizedBox(height: 30),
                    forgotPasswordButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Required";
        } else {}
      },
      onSaved: (value) {
        _emailController.text = value!;
      },
      controller: _passwordController,
      obscureText: true,
      style: TextStyle(color: Colors.white),
      decoration: customInputDecoration("Password"),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Required";
        } else {}
      },
      controller: _emailController,
      onSaved: (value) {
        _emailController.text = value!;
      },
      style: TextStyle(color: Colors.white),
      decoration: customInputDecoration("Email"),
    );
  }

  Center forgotPasswordButton() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: customText("Forget Password", Colors.deepOrange),
      ),
    );
  }

  Widget customText(String text, Color color) => Text(
        text,
        style: TextStyle(color: color),
      );

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
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

  Center signInButton() {
    return Center(
      child: TextButton(
        onPressed: logInuser,
        child: Container(
          height: 60,
          width: 150,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color.fromARGB(255, 255, 255, 255)),
          child: Center(
              child: _isloading
                  ? const CircularProgressIndicator(
                      color: Color.fromARGB(255, 23, 24, 37),
                    )
                  : customText("LogIn", Colors.black)),
        ),
      ),
    );
  }
}

Widget customText(String text, Color color) => Text(
      text,
      style: TextStyle(color: color),
    );
