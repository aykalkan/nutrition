// ignore_for_file: prefer_const_constructors, avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrition/widgets/info_card.dart';
import 'package:nutrition/widgets/numeric_step_button.dart';

class AddNewFoodScreen extends StatelessWidget {
  const AddNewFoodScreen({Key? key}) : super(key: key);

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
          ),
        ),
        title: Text(
          "Add new food",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Icons.compare,
            ),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image.network(
                    "https://www.giallozafferano.com/images/228-22832/spaghetti-with-tomato-sauce_1200x800.jpg",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Pasta with tomato sauce",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.symmetric(horizontal: 20),
              crossAxisCount: 2,
              children: [
                InfoCard(
                  title: "Calories",
                  icon: Icon(
                    Icons.local_fire_department,
                    color: Colors.amber.shade800,
                  ),
                  value: 149,
                  percentColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  maxValue: 300,
                ),
                InfoCard(
                  title: "Carbs",
                  icon: Icon(
                    Icons.spa,
                    color: Colors.amber.shade800,
                  ),
                  value: 23,
                  percentColor: Colors.amber.shade600,
                  maxValue: 50,
                  unit: "grams",
                ),
                InfoCard(
                  title: "Proteins",
                  icon: Icon(
                    Icons.set_meal,
                    color: Colors.teal,
                  ),
                  value: 6,
                  percentColor: Colors.teal,
                  maxValue: 10,
                  unit: "grams",
                ),
                InfoCard(
                  title: "Fats",
                  icon: Icon(
                    Icons.lunch_dining,
                    color: Colors.deepOrange,
                  ),
                  value: 4,
                  percentColor: Colors.deepOrange,
                  maxValue: 10,
                  unit: "grams",
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: NumericStepButton(
                onChanged: (value) => null,
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () => null,
                    child: Text(
                      "Apply",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
