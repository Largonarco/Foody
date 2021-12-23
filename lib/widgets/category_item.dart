import 'package:flutter/material.dart';

class CatItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CatItem(this.id, this.title, this.color);

  void switchScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      'meals',
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => switchScreen(context),
      borderRadius: BorderRadius.circular(10),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        child: Center(
            child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
          ),
        )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.6),
                color,
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )),
      ),
    );
  }
}
