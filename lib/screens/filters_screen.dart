import 'package:flutter/material.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/widgets/the_drawer.dart';

enum Filter { glutenFree, lactoseFree, vegitarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenValue = false;
  var lactoseValue = false;
  var vegitarianValue = false;
  var veganValue = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    glutenValue = widget.currentFilters[Filter.glutenFree]!;
    lactoseValue = widget.currentFilters[Filter.lactoseFree]!;
    veganValue = widget.currentFilters[Filter.vegan]!;
    vegitarianValue = widget.currentFilters[Filter.vegitarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // drawer: TheDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.pop(context);
      //     if (identifier == "meals") {
      //       Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(builder: (ctx) => TabsScreen()),
      //       );
      //     }
      //   },
      // ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          Navigator.of(context).pop({
            Filter.glutenFree: glutenValue,
            Filter.lactoseFree: glutenValue,
            Filter.vegan: veganValue,
            Filter.vegitarian: vegitarianValue,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              title: Text("Gluten-free"),
              value: glutenValue,
              onChanged: (isChecked) {
                setState(() {
                  glutenValue = isChecked;
                });
              },
            ),
            SwitchListTile(
              title: Text("Lactose-free"),
              value: lactoseValue,
              onChanged: (isChecked) {
                setState(() {
                  lactoseValue = isChecked;
                });
              },
            ),
            SwitchListTile(
              title: Text("Vegitarian"),
              value: vegitarianValue,
              onChanged: (isChecked) {
                setState(() {
                  vegitarianValue = isChecked;
                });
              },
            ),
            SwitchListTile(
              title: Text("Vegan"),
              value: veganValue,
              onChanged: (isChecked) {
                setState(() {
                  veganValue = isChecked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
