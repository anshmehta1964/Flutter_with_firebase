import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super (key: key);

  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: const Center(
        child: Text('Thank you for looking my project, this UI and Login is created on the sole purpose or '
            'Email authentication with firebase. Once again thank you for visiting',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
}