// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:expense_tracker/Model/Functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';

class Transfer extends StatelessWidget {
  Transfer({super.key});

  
 final values = TextEditingController();
  final from = TextEditingController();
 final to = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final gh=Provider.of<Calc>(context);
    return Scaffold(
      backgroundColor: Color(0xFF0077FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF0077FF),
        title: Padding(
          padding: const EdgeInsets.only(left: 65.0),
          child: Text(
            'Transfer',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.64,
            child: Padding(
              padding: const EdgeInsets.only(top: 185.0, left: 30),
              child: Text(
                'How much?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFBFBFB),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 223.0, left: 20),
            child: Text(
              '\$',
              style: TextStyle(
                fontSize: 63,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFBFBFB),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 210.0, left: 60),
            child: TextField(
              controller: values,
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFBFBFB),
              ),
              showCursor: false,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0',
                  hintStyle: TextStyle(
                      fontSize: 64,
                      color: Color(0xFFFBFBFB),
                      fontWeight: FontWeight.w600)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 320.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 16),
                    child: Container(
                      height: 48.8,
                      width: 148,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 210, 210, 218),
                            width: 0.50,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextField(
                          controller: from,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF90909F),
                          ),
                          showCursor: false,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'From',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF90909F),
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30.0, left: 198, right: 16),
                    child: Container(
                      height: 48.8,
                      width: 148,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 210, 210, 218),
                            width: 0.50,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextField(
                          controller: to,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF90909F),
                          ),
                          showCursor: false,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'To',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF90909F),
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 158.1),
                    child: Container(
                      height: 48.8,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color.fromARGB(255, 210, 210, 218),
                          width: 0.50,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('Assets/Images/transaction.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 125.0, left: 16, right: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 210, 210, 218),
                            width: 0.50,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: TextField(
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF90909F),
                          ),
                          showCursor: false,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Description',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF90909F),
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 210.0, left: 16, right: 16),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      color: Color.fromARGB(255, 210, 210, 218),
                      strokeWidth: 1,
                      dashPattern: [8, 10],
                      radius: Radius.circular(16),
                      child: SizedBox(
                        width: 400,
                        height: 48.8,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 100.0),
                              child: Image.asset(
                                'Assets/Images/attachment.png',
                                width: 25,
                                height: 25,
                              ),
                            ),
                            Text(
                              'Add attachment',
                              style: TextStyle(
                                  color: Color(0xFF90909F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.12),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 305.0, left: 16, right: 16),
                    child: InkWell(
                      onTap: (){
                        gh.transfer(int.parse(values.text));
                        

                        Navigator.pop(context);

                      },
                      child: Container(
                        width: 400,
                        height: 65,
                        decoration: BoxDecoration(
                            color: Color(0xFF7E3DFF),
                            borderRadius: BorderRadius.all(Radius.circular(16))),
                        child: Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                color: Color(0xFFFBFBFB),
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
