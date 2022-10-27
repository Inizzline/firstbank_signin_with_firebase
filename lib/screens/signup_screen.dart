import 'package:banksignin_ui/reusable_widget/reusable_widget.dart';
import 'package:banksignin_ui/screens/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../utilities/colours.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Welcome To FirstBank", style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("#CB2B93"),
              hexStringToColor("#9546C4"),
              hexStringToColor("#3F51B5"),
            ],
            begin: Alignment.center, end: Alignment.bottomCenter
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*0.1, 20, 0),
            child: Column(
              children: [
                logoWidget("assets/images/logo1.png"),
                SizedBox(height: 30),
                reusableTextField("USERNAME", Icons.person_outline, false, _usernameTextController),
                SizedBox(height: 10),
                reusableTextField("EMAIL ID", Icons.person_outline, false, _emailTextController),
                SizedBox(height: 10),
                reusableTextField("PASSWORD", Icons.person_outline, true, _passwordTextController),
                SizedBox(height: 50),
                signInSignUpButton(context, false, (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailTextController.text, password: _passwordTextController.text).then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
