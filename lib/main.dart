import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iot_project/Home_Screen.dart';
import 'package:iot_project/Login_Screen.dart';
import 'package:iot_project/Register_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(milliseconds: 3000), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),)),);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffefefef),
      body: Center(child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage('images/SplashScreen.png'))
          ),
      ),),
    );
  }
}


