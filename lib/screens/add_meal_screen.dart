// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrition/models/meal.dart';
import 'package:nutrition/screens/add_new_food_screen.dart';
import 'package:nutrition/widgets/meal_card.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            )),
      ),
      body: Column(
        children: [
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
          Expanded(
            child: MealCard(
              mealName: "Lunch",
              takenCalories: 352,
              calorieLimit: 500,
              meals: [
                Meal(
                  name: "Chicken breast",
                  quantity: "200 gr",
                  icon: Icon(
                    Icons.rice_bowl,
                    color: Colors.amber.shade700,
                  ),
                ),
                Meal(
                  name: "Green salad",
                  quantity: "100 gr",
                  icon: Icon(
                    Icons.takeout_dining_outlined,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MealCard(
              mealName: "Dinner",
              takenCalories: 635,
              calorieLimit: 2000,
              meals: [
                Meal(
                  name: "Pasta with tomato sauce",
                  quantity: "160 g",
                  icon: Icon(
                    Icons.dinner_dining_outlined,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Remaining",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600
              ),
            ),
            Text(
              "1,112 kcal",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        subtitle: LinearPercentIndicator(
          percent: 0.75,
          padding: EdgeInsets.zero,
          progressColor: Theme.of(context).primaryColor,
        ),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 60,
            height: 60,
            color: Theme.of(context).primaryColor,
            child: IconButton(
              color: Colors.white,
              onPressed: () => Get.to(AddNewFoodScreen()),
              icon: Icon(
                Icons.add,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
