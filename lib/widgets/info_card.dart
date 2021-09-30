// ignore_for_file: prefer_const_constructors

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    required this.title,
    required this.icon,
    required this.value,
    this.maxValue = 1000,
    required this.percentColor,
    this.unit = "kcal",
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    Key? key,
  }) : super(key: key);

  final String title;
  final String unit;
  final Icon icon;
  final int value;
  final int maxValue;
  final Color percentColor;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: backgroundColor == Colors.white
                  ? Colors.grey.shade400
                  : backgroundColor),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: foregroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  icon,
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 80,
                  child: Transform.rotate(
                    angle: math.pi * 1.5,
                    child: LinearPercentIndicator(
                      percent: value / maxValue,
                      lineHeight: 10,
                      width: 80,
                      progressColor: percentColor,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "$value",
                        style: TextStyle(
                          color: foregroundColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      unit,
                      style: TextStyle(
                        color: foregroundColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
