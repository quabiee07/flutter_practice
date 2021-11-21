import 'package:flutter/material.dart';
import 'package:practice2/models/grocery_manager.dart';
import 'package:practice2/screens/empty_grocery_screen.dart';
import 'package:practice2/screens/grocery_list_screen.dart';
import 'package:provider/provider.dart';

import 'grocery_item_screen.dart';
class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          //TODO: Show grocery Item screen when fab is clicked!
          final manager = Provider.of<GroceryManager>(
            context, listen: false);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GroceryItemScreen(
              onCreate: (item){
                manager.addItem(item);
                Navigator.pop(context);
              }, onUpdate: (_) {  },
            ))
          );
        },
      ),
      body: buildGroceryScreen(),
    );
  }
}

Widget buildGroceryScreen() {
  return Consumer<GroceryManager>(
      builder: (context, manager, child) {
        if(manager.groceryItems.isNotEmpty){
          return GroceryListScreen(manager: manager);
        } else {
          return EmptyGroceryScreen();
        }
      }
  );
}
