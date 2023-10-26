// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SpendFrequencyChart extends StatelessWidget {
  const SpendFrequencyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        AspectRatio(
            aspectRatio: 2.5,
            child: LineChart(LineChartData(
              minX: 0,
              minY: 0,
              maxX: 11,
              maxY: 6,
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: const FlTitlesData(show: false),
              lineBarsData: [
                LineChartBarData(
                    spots: const [
                      FlSpot(0, 0),
                      FlSpot(1.2, 0.8),
                      FlSpot(2, 2),
                      FlSpot(2.8, 2.4),
                      FlSpot(4.4, 1.3),
                      FlSpot(5.6, 3.3),
                      FlSpot(7.2, 1.8),
                      FlSpot(8.2, 3.3),
                      FlSpot(9.4, 5.2),
                      FlSpot(11, 4)
                    ],
                    color: const Color.fromARGB(255, 127, 61, 255),
                    barWidth: 5,
                    dotData: const FlDotData(show: false),
                    isCurved: true,
                    curveSmoothness: 0.4,
                    belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(10, 127, 61, 255),
                              Color.fromARGB(155, 255, 255, 255)
                            ])))
              ],
            ))),
      ]),
    );
  }
}
