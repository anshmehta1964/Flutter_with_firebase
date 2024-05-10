import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_with_flutter/email_auth/signup_screen.dart';
import 'package:firebase_with_flutter/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void login() async {
    String email = emailController.text.trim();
    String pass = passController.text.trim();

    if(email == "" || pass == ""){
      log("No empty fields are allowed");
    }
    else {
      try{
        UserCredential userCred = await FirebaseAuth.instance.
        signInWithEmailAndPassword(email: email, password: pass);
        if(userCred.user != null){
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(context, CupertinoPageRoute(
              builder: (context)=> HomeScreen()
          ));
          log('User logged in');
        }
      } on FirebaseAuthException catch(exception) {
        log(exception.code.toString());
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: SafeArea(
        child: ListView(
          children: [

            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [

                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "Email Address"
                    ),
                  ),

                  SizedBox(height: 10,),

                  TextField(
                    controller: passController,
                    decoration: InputDecoration(
                        labelText: "Password"
                    ),
                  ),

                  SizedBox(height: 20,),

                  CupertinoButton(
                    onPressed: () {
                      login();
                    },
                    color: Colors.blue,
                    child: Text("Log In"),
                  ),

                  SizedBox(height: 10,),

                  CupertinoButton(
                    onPressed: () {
                      Navigator.push(context, CupertinoPageRoute(
                          builder: (context) => SignUpScreen()
                      ));
                    },
                    child: Text("Create an Account"),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}