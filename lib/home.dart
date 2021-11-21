import 'package:flutter/material.dart';
import 'package:practice2/screens/explore_screen.dart';
import 'package:practice2/screens/grocery_screen.dart';
import 'package:practice2/screens/recipe_screen.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

class Home  extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = [
    ExploreScreen(),
    RecipeScreen(),
    GroceryScreen()

  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child){
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'NriBox',
            style: Theme.of(context).textTheme.headline6,
          ),
          centerTitle: true,
        ),
        body: pages[_selectedIndex],

        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
          Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Recipes'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'To Buy'
            ),
          ],
        ),
      );
    });
  }
}
