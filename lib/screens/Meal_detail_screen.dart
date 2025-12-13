import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.star_outline))],
      ),
      body: ListView(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
          ),
          SizedBox(height: 12),
          Text(
            "Ingredients",
            style: TextStyle(
              color: Colors.orangeAccent,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 10),
          for (final ingrediant in meal.ingredients)
            Text(
              ingrediant,
              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.8),
            ),
          SizedBox(height: 14),
          Text(
            "Steps",
            style: TextStyle(
              color: Colors.orangeAccent,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 14),
          for (int i = 0; i < meal.steps.length; i++)
            Text(
              '${i + 1}. ${meal.steps[i]}',
              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.8),
            ),
        ],
      ),
    );
  }
}
