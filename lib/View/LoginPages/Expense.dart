// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

// import 'package:expense_tracker/1stPage.dart';
// import 'package:expense_tracker/Transactions.dart';
import 'package:expense_tracker/Model/HiveFunctions.dart';
import 'package:expense_tracker/Model/Functions.dart';
import 'package:expense_tracker/Model/Model/DataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

class Expenses extends StatelessWidget {
  
  Expenses({super.key});

  TextEditingController expen = TextEditingController();
   TextEditingController desp = TextEditingController();

  final List<String> items = [
    'Shopping',
    'Fuel',
    'Travel',
    'Personal',
    'Bills',
  ];

  

  final List<String> wallet = [
    'Google Pay',
    'Phone pe',
    'Paytm',
    'Amazon pay',
    'Other UPI\'s'
  ];

  String? selected;

  
  @override
  Widget build(BuildContext context) {
    final gh = Provider.of<Calc>(context);
    return Scaffold(
      backgroundColor: Color(0xFFFD3C4A),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFD3C4A),
        title: Padding(
          padding: const EdgeInsets.only(left: 65.0),
          child: Text(
            'Expenses',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.64,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 30),
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
            padding: const EdgeInsets.only(top: 133.0, left: 20),
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
            padding: const EdgeInsets.only(top: 120.0, left: 60),
            child: TextField(
              controller: expen,
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
            padding: const EdgeInsets.only(top: 215.0),
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
                    padding:
                        const EdgeInsets.only(top: 30.0, left: 16, right: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 210, 210, 218),
                            width: 0.50,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Category',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.12,
                              color: Color(0xFF90909F),
                            ),
                          ),
                          items: items
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: gh.expensecategory,
                          onChanged: (value) {
                            gh.expenseCategoryDropdownbutton(value);
                          },
                          buttonStyleData: ButtonStyleData(),
                          menuItemStyleData: MenuItemStyleData(),
                          iconStyleData: IconStyleData(
                              icon: Image.asset(
                            'Assets/Images/arrow-down-2.png',
                            width: 30,
                            color: const Color.fromARGB(255, 145, 145, 159),
                            filterQuality: FilterQuality.high,
                          )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 100.0, left: 16, right: 16),
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
                          controller: desp,
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
                        const EdgeInsets.only(top: 170.0, left: 16, right: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 210, 210, 218),
                            width: 0.50,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Wallet',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.12,
                              color: Color(0xFF90909F),
                            ),
                          ),
                          items: wallet
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: gh.expensewallet,
                          onChanged: (value) {
                            gh.expenseWallet(value);
                          },
                          buttonStyleData: ButtonStyleData(),
                          menuItemStyleData: MenuItemStyleData(),
                          iconStyleData: IconStyleData(
                              icon: Image.asset(
                            'Assets/Images/arrow-down-2.png',
                            width: 30,
                            color: const Color.fromARGB(255, 145, 145, 159),
                            filterQuality: FilterQuality.high,
                          )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 243.0, left: 16, right: 16),
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
                    padding: const EdgeInsets.only(top: 316.0, left: 36),
                    child: Text(
                      'Repeat',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 340.0, left: 35),
                    child: Text(
                      'Repeat transaction',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF90909F),
                          height: 1.23),
                    ),
                  ),
                  Positioned(
                      right: 35,
                      top: 330,
                      child: FlutterSwitch(
                        value: gh.isSwitched,
                        width: 46,
                        height: 24,
                        toggleSize: 24.0,
                        borderRadius: 30.0,
                        padding: 0.1,
                        activeColor: Colors.grey,
                        onToggle: (val) {
                          gh.expenseFlutterSwitch(val);
                        },
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 400.0, left: 16, right: 16),
                    child: InkWell(
                      onTap: () {
                        gh.onSub(int.parse(expen.text));

                        int ff = int.parse(expen.text);

                        adi(DataModel(category:gh.expensecategory??'', description: desp.text, money: ff, wallet:gh.expensewallet??'',displayMoney: false));

                            

                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 400,
                        height: 65,
                        decoration: BoxDecoration(
                            color: Color(0xFF7E3DFF),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
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
