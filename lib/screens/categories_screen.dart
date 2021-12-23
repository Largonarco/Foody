import 'package:flutter/material.dart';
import '/models/meals.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class Categories extends StatelessWidget {
  final List<Meal> filteredMeals;

  Categories(this.filteredMeals);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10),
        children: DUMMY_CATEGORIES
            .map((e) => CatItem(e.id, e.title, e.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.4,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15));
  }
}
