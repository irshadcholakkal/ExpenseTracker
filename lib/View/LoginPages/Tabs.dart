// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: TabBar(
          labelColor: Color.fromARGB(170, 252, 170, 18),
          unselectedLabelColor: Colors.grey.shade300,
          splashBorderRadius: BorderRadius.all(Radius.circular(120)),
          splashFactory: NoSplash.splashFactory,
          indicator: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromARGB(39, 252, 170, 18),
              borderRadius: BorderRadius.all(Radius.circular(120))),
          indicatorPadding: EdgeInsets.all(6.5),
          tabs: [
            Tab(
              text: 'Today',
            ),
            Tab(
              text: 'Week',
            ),
            Tab(
              text: 'Month',
            ),
            Tab(
              text: 'Year',
            )
          ]),
    );
  }
}
