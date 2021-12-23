import 'package:flutter/material.dart';
import '../widgets/meal_card.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final mealData = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget container(String title) {
      return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 15),
        child: Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${mealData.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: Color.fromRGBO(255, 254, 229, 1),
              child: MealDisplay(
                imageUrl: mealData.imageUrl,
                title: mealData.title,
                duration: mealData.duration,
                complexity: mealData.complexity,
                affordability: mealData.affordability,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                height: 270,
              ),
            ),
            container('Ingredients'),
            Column(
                children: mealData.ingredients.map((meal) {
              return Container(
                padding: const EdgeInsets.all(2),
                child: Text(
                  meal,
                  style: TextStyle(fontSize: 18),
                ),
              );
            }).toList()),
            container('Steps to cook'),
            Column(
                children: mealData.steps.map((step) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      '$step',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(
                    color: Colors.black87,
                    thickness: 2,
                    indent: 100,
                    endIndent: 100,
                  ),
                ],
              );
            }).toList()),
          ],
        ),
      ),
    );
  }
}
