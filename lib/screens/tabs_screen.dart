import 'package:flutter/material.dart';
import '/dummy_data.dart';
import '/models/meals.dart';
import '/screens/settings_screen.dart';
import '/screens/categories_screen.dart';
import '/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;

  static Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  static List<Meal> _filteredMeals = DUMMY_MEALS;

  List<Widget> _tabs = [
    Categories(_filteredMeals),
    Favorites(),
    SettingsScreen(_setFilters),
  ];

  void _changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }

  static void _setFilters(Map<String, bool> filterData){
    
    _filters = filterData;

    _filteredMeals = DUMMY_MEALS.where((meal) {
    if (_filters['gluten'] == true && !meal.isGlutenFree) {
      return false;
    }
    if (_filters['lactose'] == true && !meal.isLactoseFree) {
      return false;
    }
    if (_filters['vegan'] == true && !meal.isVegan) {
      return false;
    }
    if (_filters['vegetarian'] == true && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foody'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _changeIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_rounded), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _tabs[_selectedIndex],
    );
  }
}
