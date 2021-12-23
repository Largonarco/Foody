import 'package:flutter/material.dart';
import '../models/meals.dart';
import 'meal_card.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability});

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('meal_detail', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        selectMeal(context);
      },
      child: Card(
          margin: EdgeInsets.all(10),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: MealDisplay(
            imageUrl: imageUrl,
            title: title,
            duration: duration,
            complexity: complexity,
            affordability: affordability,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            height: 210,
          )),
    );
  }
}
