import 'package:flutter/material.dart';

class Meal {
  Meal({
    required this.name,
    required this.quantity,
    required this.icon,
  });

  final String name;
  final String quantity;
  final Icon icon;
}
