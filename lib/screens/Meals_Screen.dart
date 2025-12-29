import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meals_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.mealTitle, required this.meals});

  final String mealTitle;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealsItem(meal: meals[index]),
    );
    
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          children: [
            Text(
              "No dishes here , check another category",
              style: TextStyle(
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(mealTitle)),
      body: content,
    );
  }
}
