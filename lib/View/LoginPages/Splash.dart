// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:expense_tracker/View/LoginPages/HomePage.dart';
import 'package:expense_tracker/View/LoginPages/LoginOrSignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => StreamBuilder(
      stream:
       FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        // if (snapshot.hasData) {
        //   return CircularProgressIndicator(); // Or any loading indicator
        // } 
        if (snapshot.hasData) {
          return FirstPage(); // User is logged in, go to main page
        } else {
          return LoginOrSignUp(); // User is not logged in, go to registration screen
        }
      },
    ),
    
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF7E3DFF),
        body: Center(
          child: Text(
            'montra',
            style: TextStyle(
                letterSpacing: 1.5,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 45),
          ),
        ));
  }
}
