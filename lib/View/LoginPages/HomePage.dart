// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

// import 'package:expense_tracker/Images/bottomnavigation.dart';
import 'package:expense_tracker/Model/Firestore.dart';
import 'package:expense_tracker/View/LoginPages/Expense.dart';
// import 'package:expense_tracker/Images/bottomnavigation.dart';
import 'package:expense_tracker/View/LoginPages/Income.dart';
import 'package:expense_tracker/View/LoginPages/Tabs.dart';
import 'package:expense_tracker/View/LoginPages/Transfer.dart';
import 'package:expense_tracker/Model/HiveFunctions.dart';
import 'package:expense_tracker/Model/Functions.dart';
import 'package:expense_tracker/View/LoginPages/Transactions.dart';
import 'package:expense_tracker/View/LoginPages/TransactionsHistory.dart';

import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';
import 'SpendFrequencyChart.dart';
//import 'bottomnavigation.dart';

// ignore: must_be_immutable
class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gh = Provider.of<Calc>(context);
    final List<String> items = [
      'November',
      'December',
      'January',
      'February',
    ];

    // String? months;
    getdata();
    return Scaffold(
            resizeToAvoidBottomInset: false,

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      bottomNavigationBar: BottomAppBar(
        notchMargin: 60,

        height: 55,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'Assets/Images/home.png',
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>History()));
              },
              child: Image.asset(
                'Assets/Images/transaction.png',
                height: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Image.asset(
                'Assets/Images/pie-chart.png',
                color: Color.fromARGB(255, 102, 24, 220),
                height: 30,
              ),
            ),
            Image.asset(
              'Assets/Images/user.png',
              color: Color.fromARGB(255, 102, 24, 220),
              height: 30,
            ),
            
                      

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FabCircularMenuPlus(
        fabSize: 55,
        alignment: Alignment.bottomCenter,
        fabColor: Color.fromARGB(255, 102, 24, 220),
        ringDiameter: 220,
        ringWidth: 2,
        ringColor: Colors.transparent,
        fabOpenIcon: Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        ),
        fabCloseIcon: Icon(
          Icons.close,
          size: 30,
          color: Colors.white,
        ),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Income(),
                  ));
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.green),
              child: Image.asset(
                'Assets/Images/income.png',
                color: Colors.white,
                scale: 14,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Transfer(),
                  ));
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.blue),
              child: Image.asset(
                'Assets/Images/currency-exchange.png',
                scale: 18,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Expenses(),
                  ));
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.red),
              child: Image.asset(
                'Assets/Images/expense.png',
                color: Colors.white,
                scale: 14,
              ),
            ),
          )
        ],
      ),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      body: Column(
        children: [
          Stack(
            fit: StackFit.loose,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 312,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32)),
                  color: Color(0xFFFFF6E5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 42, left: 10),
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              FireStoressssss().addinng(gh);
                              
                            },
                            child: CircleAvatar(
                                radius: 24,
                                backgroundColor: Color(0xFFAD00FF),
                                child: CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                      radius: 19.5,
                                      backgroundImage: AssetImage(
                                        'Assets/Images/casual-life-3d-avatar-girl-with-pink-hair.png'
                                      )),
                                )),
                          ),
                          Container(
                            width: 110,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // color: Colors.grey,
                                border: Border.all(
                                    color: Colors.grey.shade200)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Text(
                                  'October',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 1.29,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: items
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: gh.months,
                                onChanged: (String? value) {
                                  gh.firstpagemonthdropdownbutton(value);
                                },
                                buttonStyleData: ButtonStyleData(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 6),
                                  height: 40,
                                  width: 140,
                                ),
                                menuItemStyleData: MenuItemStyleData(
                                  height: 40,
                                ),
                                iconStyleData: IconStyleData(
                                    icon: Image.asset(
                                  'Assets/Images/arrow-down-2.png',
                                  width: 30,
                                  color: const Color.fromARGB(
                                      255, 127, 61, 255),
                                  filterQuality: FilterQuality.high,
                                )),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => MyWidget())),
                              );
                            },
                            icon: Icon(
                              Icons.notifications,
                              size: 27,
                              color:
                                  const Color.fromARGB(255, 127, 61, 255),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 122, vertical: 54),
                        child: InkWell(
                          onTap: () {
                            FireStoressssss().getdata();
                          },
                          child: Text(
                            'Account Balance',
                            style: TextStyle(
                              color: Color(0xFF90909F),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 74.0, left: 114),
                        child: SizedBox(
                          child: Text(
                            '\$' '${gh.result}',
                            style: TextStyle(
                                color: Color(0xFF161719),
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter'),
                          ),
                        ),
                      ),
                      // INCOME*************************************************************************************************************************
                      Padding(
                        padding: const EdgeInsets.only(top: 150.0, left: 8),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Income()));
                          },
                          child: Container(
                            width: 154,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Color(0xFF00A86B),
                                borderRadius: BorderRadius.circular(28)),
                            child: Stack(
                              fit: StackFit.loose,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, top: 16),
                                  child: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFBFBFB),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'Assets/Images/income.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 17.0, left: 72),
                                  child: Text(
                                    'Income',
                                    style: TextStyle(
                                        color: Color(0xFFFBFBFB),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 37.0, left: 70),
                                  child: Text(
                                    '\$${gh.inc}',
                                    style: TextStyle(
                                        color: Color(0xFFFBFBFB),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // EXPENSE ******************************************************************************************************************

                      Padding(
                        padding:
                            const EdgeInsets.only(top: 150.0, left: 180),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Expenses()));
                          },
                          child: Container(
                            width: 154,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Color(0xFFFD3C4A),
                                borderRadius: BorderRadius.circular(28)),
                            child: Stack(
                              fit: StackFit.loose,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, top: 16),
                                  child: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFBFBFB),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'Assets/Images/expense.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 17.0, left: 72),
                                  child: Text(
                                    'Expenses',
                                    style: TextStyle(
                                        color: Color(0xFFFBFBFB),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 37.0, left: 70),
                                  child: Text(
                                    '\$${gh.exp}',
                                    style: TextStyle(
                                        color: Color(0xFFFBFBFB),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //*****************************************************************************************************************************
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  'Spend Frequency',
                  style: TextStyle(
                      color: Color(0xFF0D0E0F),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter'),
                )
              ],
            ),
          ),
          //****************************************************************************************************** */
          SpendFrequencyChart(),

          Tabs(),
          //***************************************************************************************************************************** */
          Column(
            children: [
              
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  
                  ),
                  Text(
                    'Recent Transaction',
                    style: TextStyle(
                        color: Color(0xFF292B2D),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 120,),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>History()));
                    },
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                      backgroundColor: MaterialStatePropertyAll(
                        Color(0xFFEEE5FF),
                      ),
                    ),
                    
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xFF7E3DFF),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.29,
                      ),
                    ),
                  ),
                  
                ],
              ),
              Column(
                children: [
                   SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 172,
              child: MyWidget()),
          )
                ],
              )
            ],
          ),
         
          
        ],
      ),
    );
  }
}
