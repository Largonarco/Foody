import 'package:flutter/material.dart';
import '../models/meals.dart';

class MealDisplay extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final BorderRadius borderRadius;
  final double height;

  const MealDisplay({
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.borderRadius,
    required this.height,
  });

  String get complexityText {
    if (complexity == Complexity.Simple) return 'Simple';
    if (complexity == Complexity.Challenging) return 'Challenging';
    if (complexity == Complexity.Hard)
      return 'Hard';
    else
      return 'Unknown';
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable) return 'Affordable';
    if (affordability == Affordability.Pricey) return 'Pricey';
    if (affordability == Affordability.Luxurious)
      return 'Luxurious';
    else
      return 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: borderRadius,
              child: Image.network(
                imageUrl,
                height: height,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: Container(
                width: 230,
                color: Colors.black38,
                padding: EdgeInsets.all(3),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
              bottom: 20,
              right: 10,
            )
          ],
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(Icons.schedule_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '$duration min',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.work_outline_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    complexityText,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.attach_money_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    affordabilityText,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
