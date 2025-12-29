import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/Meal_detail_screen.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx)=> MealDetailScreen(meal: meal)));
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 280,
              width: double.infinity,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 10,
                    vertical: 115,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemTrait(
                              icon: Icons.schedule,
                              label: "${meal.duration} min",
                            ),
                            SizedBox(width: 12),
                            MealItemTrait(
                              icon: Icons.work,
                              label: meal.complexity.name,
                            ),
                            SizedBox(width: 12),
                            MealItemTrait(
                              icon: Icons.attach_money,
                              label: meal.affordability.name,
                            ),
                            // Text(meal.affordability.name,style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
