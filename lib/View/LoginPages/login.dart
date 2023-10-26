// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:expense_tracker/Model/Authentication.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }
   String password='';
  String email='';
  

  final Auth =Authentication();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  width: 93,
                ),
                Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 60,
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
              height: 50,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    if (email.isEmpty || password.isEmpty) {
                  Auth.noti('field is empty');


                  
                } 
                Auth.signInWithEmailAndPassword(email, password,context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 14,
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: BoxDecoration(
                        color: Color(0xFF7E3DFF),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      'Login',
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
                  height: 40,
                ),
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xFF7E3DFF),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 18,),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: 'Don’t have an account yet? ',
                    style: TextStyle(
                      color: Color(0xFF90909F),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      color: Color(0xFF7E3DFF),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ]))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
