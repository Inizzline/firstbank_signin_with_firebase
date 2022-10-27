

import 'package:banksignin_ui/screens/signup_screen.dart';
import 'package:banksignin_ui/utilities/colours.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reusable_widget/reusable_widget.dart';
import 'homescreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                hexStringToColor("#C5CAE9"),
                hexStringToColor("#448AFF"),
                hexStringToColor("#3F51B5"),
                hexStringToColor("#303F9F"),
                hexStringToColor("#303F9F"),
            ],
            begin: Alignment.topCenter, end: Alignment.bottomCenter
          )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: [
                logoWidget("assets/images/firstbank.png"),
                SizedBox(height: 30),
                reusableTextField("ENTER USERNAME", Icons.person_outline, false, _emailTextController),
                SizedBox(height: 10),
                reusableTextField("ENTER PASSWORD", Icons.lock_outline, true, _passwordTextController),
                SizedBox(height: 35),
                signInSignUpButton(context, true, (){
                  FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  });
                }),
                SizedBox(height: 80),
                signUpOption()
              ]
            ),
          ),
        ),
      ),
    );
  }
  Row signUpOption () {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ", style: TextStyle(color: Colors.white70),),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: Text("SIGNUP",
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        )
      ],
    );
  }
}
