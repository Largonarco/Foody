import 'package:flutter/material.dart';
import '../screens/tabs_screen.dart';
import '../screens/meal_detail_screen.dart';
import 'screens/meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Foody',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
        ),
        home: TabsScreen(),
        routes: {
          'meals': (ctx) => MealsScreen(),
          'meal_detail': (ctx) => MealDetailScreen(),
       
        });
  }
}
