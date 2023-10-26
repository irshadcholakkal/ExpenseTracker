// ignore_for_file: sort_child_properties_last, prefer_const_constructors, use_key_in_widget_constructors

import 'package:dots_indicator/dots_indicator.dart';
import 'package:expense_tracker/View/LoginPages/SignUp.dart';
import 'package:expense_tracker/View/LoginPages/login.dart';
import 'package:flutter/material.dart';

class LoginOrSignUp extends StatefulWidget {
  @override
  State<LoginOrSignUp> createState() => _LoginState();
}

class _LoginState extends State<LoginOrSignUp> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _slides = [Slide1(), Slide2(), Slide3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          SafeArea(
            child: SizedBox(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                scrollDirection: Axis.horizontal,
                padEnds: false,
                controller: _pageController,
                children: _slides,
                physics: PageScrollPhysics(),
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
          ),
          DotsIndicator(
            dotsCount: _slides.length,
            position: _currentPage.toInt(),
            decorator: DotsDecorator(
              color: Colors.grey, // Inactive dot color
              activeColor: Colors.blue, // Active dot color
              size: const Size.square(10.0),
              activeSize: const Size(18.0, 9.0),
              spacing: const EdgeInsets.all(2.0),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width - 55,
                  decoration: BoxDecoration(
                      color: Color(0xFF7E3DFF),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFBFBFB),
                      fontSize: 19,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width - 55,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 228, 220, 245),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF7E3DFF),
                      fontSize: 19,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget Slide1() {
  return Column(
    children: [
      SizedBox(
        height: 300,
        width: 400,
        child: Image.asset('Assets/Images/Illustration.jpg'),
      ),
      Text(
        'Gain total control \nof your money',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF212224),
          fontSize: 32,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(
        height: 40,
      ),
      Text(
        'Become your own money manager \nand make every cent count',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromARGB(255, 183, 183, 199),
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

Widget Slide2() {
  return Column(
    children: [
      SizedBox(
        height: 300,
        width: 400,
        child: Image.asset('Assets/Images/Illustration1.jpg'),
      ),
      Text(
        'Know where your \nmoney goes',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF212224),
          fontSize: 32,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(
        height: 40,
      ),
      Text(
        'Track your transaction easily,\nwith categories and financial report',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromARGB(255, 183, 183, 199),
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      )
    ],
  );
}

Widget Slide3() {
  return Column(
    children: [
      SizedBox(
        height: 300,
        width: 400,
        child: Image.asset('Assets/Images/Illustration2.jpg'),
      ),
      Text(
        'Planning ahead',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF212224),
          fontSize: 32,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(
        height: 40,
      ),
      Text(
        'Setup your budget for each category\nso you in control',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromARGB(255, 183, 183, 199),
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      )
    ],
  );
}
