import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_with_flutter/email_auth/login_screen.dart';
import 'package:firebase_with_flutter/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_with_flutter/home_screen.dart';

void main() async {
  // it checks that flutter app related configuration is initialized or notdart pub global activate flutterfire_cli
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
