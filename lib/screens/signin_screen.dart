import 'package:evacuatem/screens/home_screen.dart';
import 'package:evacuatem/screens/signup_screen.dart';
import 'package:evacuatem/screens/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:evacuatem/reusable_widgets/reusable_widgets.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.1, 20, 0),
              child: Column(
                children:<Widget>[
                  logoWidget("assets/images/logo v2smal.png"),
                   const Text(
                   "E-vacuate",
                   style: TextStyle(color: Color.fromARGB(207, 24, 29, 49), fontWeight: FontWeight.bold, fontSize: 50),
                     ),
                  SizedBox(
                    height: 30,
                  ),
                 
                   
                  reusableTextField("Enter Username", Icons.person_outline, false, 
                  _emailTextController),
                  SizedBox(
                    height:20,
                  ),
                  reusableTextField(
                    "Enter Password", Icons.lock_outline, true, _passwordTextController),
                    SizedBox(
                      height: 20,
                    ),
                
                    signInSignUpButton(context, true, () {
                      FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                        email: _emailTextController.text, 
                        password: _passwordTextController.text)
                        .then((value){
                        print("Logged In");
                         Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                      });
                    }),
                    signUpOption()
                ],
              ),
            ),
          ),
        ),
      );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account? ",
        style: TextStyle(color: Colors.blueGrey)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
  }

