// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, camel_case_types, prefer_interpolation_to_compose_strings, sort_child_properties_last, must_be_immutable

import 'package:expense_tracker/Model/Authentication.dart';
import 'package:expense_tracker/Model/Functions.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpVerificationPage extends StatelessWidget {
  OtpVerificationPage({super.key});

  final authentication = Authentication();

  TextEditingController phonenumber = TextEditingController();

  TextEditingController otpnum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Calc>(context);
    return Scaffold(
            resizeToAvoidBottomInset: false,

      body: provider.page ? number(context):otppage(context),
    );
  }

  Widget number(BuildContext context) {
    final provider = Provider.of<Calc>(context);
    return Container(
      
      child: Column(
        children: [
          SizedBox(
            height: 140,
          ),
          Center(
            child: Image.asset(
              'Assets/Images/send-message.png',
              height: 100,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Verification',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 60,
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'We will send you a',
                  style: TextStyle(color: Colors.black38)),
              TextSpan(
                  text: ' One Time Password ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              TextSpan(
                  text: 'on your phone number',
                  style: TextStyle(color: Colors.black38))
            ])),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width - 50,
            child: TextField(
              controller: phonenumber,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              cursorColor: Colors.black,
              cursorHeight: 25,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
              decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    'Assets/Images/icons8-india-48 (1).png',
                    scale: 2.5,
                  ),
                  prefixText: '+91',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () {
            //  String num = phonenumber.text;

              if (phonenumber.text.length==10) {
                
                provider.pages(false);
                String num='+91'+phonenumber.text;
                authentication.phoneverification(num);
              } else {
                authentication.noti('Please Check the Number');
              }
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 12,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF7E3DFF),
              ),
              child: Center(
                child: Text(
                  'Get OTP',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget otppage(BuildContext context) {
    final provider = Provider.of<Calc>(context);
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 140,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Image.asset(
                'Assets/Images/32643067.jpg',
                height: 130,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: 'You will get a OTP via',
                style: TextStyle(color: Colors.black38)),
            TextSpan(
                text: ' SMS', style: TextStyle(fontWeight: FontWeight.w500))
          ])),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            child: Pinput(
              length: 6,
              controller: otpnum,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsRetrieverApi,
                  listenForMultipleSmsOnAndroid: true,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 210.0),
            child: InkWell(
              onTap: () {
                provider.pages(true);
               
              },
              child: SizedBox(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Check Your ',
                      style: TextStyle(color: Colors.black38, fontSize: 10)),
                  TextSpan(
                      text: 'Number',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 10))
                ])),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          InkWell(
            onTap: () {
              authentication.sms(otpnum.text,context);
              provider.pages(false);
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 12,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF7E3DFF),
              ),
              child: Center(
                child: Text(
                  'Verifiy',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
