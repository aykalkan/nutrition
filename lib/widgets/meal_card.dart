// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutrition/models/meal.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    required this.mealName,
    required this.takenCalories,
    this.calorieLimit = 1000,
    this.meals = const [],
    Key? key,
  }) : super(key: key);

  final String mealName;
  final int takenCalories;
  final int calorieLimit;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CircularPercentIndicator(
                  radius: 28,
                  percent: takenCalories / calorieLimit,
                  lineWidth: 5,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.teal,
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  mealName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  "$takenCalories kcal",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 30),
              child: ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) => FoodEntryTile(
                  title: meals[index].name,
                  subtitle: meals[index].quantity,
                  icon: meals[index].icon,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodEntryTile extends StatelessWidget {
  const FoodEntryTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
