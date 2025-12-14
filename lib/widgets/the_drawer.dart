import 'package:flutter/material.dart';

class TheDrawer extends StatelessWidget {
  const TheDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Icon(Icons.fastfood, size: 48),
                SizedBox(width: 18),
                Text(
                  "Cooking up!",
                  style: TextStyle(color: Colors.brown, fontSize: 24),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant,size: 30,),
            title: Text("Meals",style: TextStyle(fontSize: 22),),
            textColor: Colors.white,
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings,size: 30,),
            title: Text("Filters",style: TextStyle(fontSize: 22),),
            textColor: Colors.white,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
