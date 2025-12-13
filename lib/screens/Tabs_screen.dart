import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/Meals_Screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/widgets/meals_item.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> favouriteMeals = [];
  
  void toggleMealFavourites(Meal meal) {
    final isExisting = favouriteMeals.contains(meal);
    if (isExisting) {
      favouriteMeals.remove(meal);
    } else {
      favouriteMeals.add(meal);
    }
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var activePageTitle = "Categories";
    Widget activePage = Categories();
    if (selectedPageIndex == 1) {
      activePage = MealsScreen(mealTitle: "Your Favourites", meals: []);
      activePageTitle = "Your Favourites";
    }
    return Scaffold(
      // appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        onTap: selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Category",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favarotes"),
        ],
      ),
    );
  }
}
