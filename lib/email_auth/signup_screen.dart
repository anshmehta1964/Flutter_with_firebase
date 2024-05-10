import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cpassController = TextEditingController();

  void createAccount() async {
    String email = emailController.text.trim();
    String pass = passController.text.trim();
    String cpass = cpassController.text.trim();

    if(email == "" || pass == "" || cpass == ""){
      log("No empty fields are allowed");
    }
    else if(pass != cpass){
      log("Passwords don't match!");
    }
    else{
      try{
        UserCredential userCredential = await FirebaseAuth.instance.
        createUserWithEmailAndPassword(email: email, password: cpass);
        log('User Created Successfully');
        if(userCredential.user != null){
          Navigator.pop(context);

        }
      } on FirebaseAuthException catch (exception){
        log(exception.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create an account"),
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

                  SizedBox(height: 10,),

                  TextField(
                        controller: cpassController,
                        decoration: InputDecoration(
                        labelText: "Confirm Password"
                    ),
                  ),

                  SizedBox(height: 20,),

                  CupertinoButton(
                    onPressed: () {
                      createAccount();
                    },
                    color: Colors.blue,
                    child: Text("Create Account"),
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}