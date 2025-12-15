import 'package:flutter/material.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/widgets/the_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: TheDrawer(
        onSelectScreen: (identifier) {
          Navigator.pop(context);
          if (identifier=="meals") {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (ctx) => TabsScreen()),
          );
          }
        },
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text("Gluten-free Meal"),
            value: glutenValue,
            onChanged: (isChecked) {
              setState(() {
                glutenValue = isChecked;
              });
            },
          ),
        ],
      ),
    );
  }
}
