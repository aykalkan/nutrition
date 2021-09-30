// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:nutrition/models/meal.dart';
import 'package:nutrition/screens/add_meal_screen.dart';
import 'package:nutrition/widgets/info_card.dart';
import 'package:nutrition/widgets/meal_card.dart';
import 'package:nutrition/widgets/remaining_card.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 40,
            ),
            title: Text(
              "Today",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            subtitle: Text(
              "Wed, 18 Aug",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                return null;
              },
              icon: Icon(
                Icons.calendar_today,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          RemainingCard(),
          Row(
            children: [
              InfoCard(
                title: "Intaked",
                icon: Icon(Icons.local_pizza_outlined, color: Colors.red),
                value: 589,
                percentColor: Colors.teal,
              ),
              InfoCard(
                title: "Burned",
                icon:
                    Icon(Icons.local_fire_department, color: Colors.deepOrange),
                value: 738,
                percentColor: Colors.deepOrange,
              )
            ],
          ),
          Expanded(
            child: MealCard(
              mealName: "Breakfast",
              takenCalories: 407,
              meals: [
                Meal(
                  name: "Espresso coffee",
                  quantity: "30 ml",
                  icon: Icon(
                    Icons.coffee,
                    color: Colors.brown,
                  ),
                ),
                Meal(
                  name: "Croissant",
                  quantity: "100 gr",
                  icon: Icon(
                    Icons.bakery_dining_outlined,
                    color: Colors.amber.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              return null;
            },
            icon: Icon(
              Icons.home_filled,
              color: Theme.of(context).primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {
              return null;
            },
            icon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox.square(
                dimension: 60,
                child: ElevatedButton(
                  onPressed: () {
                    return null;
                  },
                  child: Icon(
                    Icons.compare,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(AddMealScreen());
            },
            icon: Icon(
              Icons.insert_chart_outlined,
              color: Theme.of(context).primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {
              return null;
            },
            icon: Icon(
              Icons.person,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
