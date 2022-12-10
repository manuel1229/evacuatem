// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evacuatem/reusable_widgets/reusable_widgets.dart';
import 'package:evacuatem/screens/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'home_screen.dart';


class  SignUpScreen extends StatefulWidget {
 const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
       body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [ 
      hexStringToColor("FFEFD6"),
      hexStringToColor("FFEFD6")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
           child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Username", Icons.person_outline, false,
                   _userNameTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Email ID", Icons.email_outlined, false,
                   _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_open_outlined, true,
                   _passwordTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  signInSignUpButton(context, false, () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailTextController.text, 
                      password: _passwordTextController.text)
                      .then((value) {
                        // FirebaseFirestore.instance.collection('UserData').doc(value.user?.uid).set({"email": value.user?.email});
                        print("Created New Accounnt");
                         Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                   
                  })
                ],
        ),
      ))),
    );
  }
}