// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:expense_tracker/Model/Authentication.dart';
import 'package:expense_tracker/View/LoginPages/OtpVerificationPage.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }
  String password='';
  String email='';

  final Auth =Authentication();

  


  bool? check1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                    )),
                SizedBox(
                  width: 90,
                ),
                Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.height / 14,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 210, 210, 218),
                        width: 0.90,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 3),
                    child: TextField(
                     
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      showCursor: true,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF90909F),
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.height / 14,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 210, 210, 218),
                        width: 0.90,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 3),
                    child: TextField(
                      onChanged: (value) => email=value,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      showCursor: true,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF90909F),
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.height / 14,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 210, 210, 218),
                        width: 0.90,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 3),
                    child: TextField(
                      onChanged: (value) => password=value,
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                        alignLabelWithHint: false,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 80,
                    ),
                    Checkbox(
                      value: check1,
                      onChanged: (bool? value) {
                        setState(() {
                          check1 = value;
                        });
                      },
                      activeColor: const Color.fromARGB(255, 127, 61, 255),
                      shape: ContinuousRectangleBorder(
                        side: BorderSide(width: 3, strokeAlign: 3),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      side: BorderSide(
                          width: 1.5,
                          color: const Color.fromARGB(255, 127, 61, 255)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 280,
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                          text: 'By signing up, you agree to the ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of Service and Privacy Policy',
                          style: TextStyle(
                            color: Color(0xFF7E3DFF),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ])),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                      if (email.isEmpty || password.isEmpty) {
                  Auth.noti('field is empty');


                  return; // Exit the function early
                } Auth.createUserWithEmailAndPassword(email, password,context);
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
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Or with',
                  style: TextStyle(
                    color: Color(0xFF90909F),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Auth.signInWithGoogle(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: MediaQuery.of(context).size.height / 14,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 210, 210, 218),
                          width: 0.90,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        Image.asset(
                          'Assets/Images/flat-color-icons_google.png',
                          height: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Sign Up with Google',
                          style: TextStyle(
                            color: Color(0xFF212224),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OtpVerificationPage(),));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: MediaQuery.of(context).size.height / 14,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 210, 210, 218),
                            width: 0.90,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Image.asset(
                            'Assets/Images/phone.png',
                            height: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          
                          Text(
                            'Phone Number',
                            style: TextStyle(
                              color: Color(0xFF212224),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: Color(0xFF90909F),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Color(0xFF7E3DFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ]))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  }

