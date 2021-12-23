import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function saveFilters;

  SettingsScreen(this.saveFilters);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text('Gluten free'),
          trailing: Checkbox(
              value: _isGlutenFree,
              onChanged: (value) {
                setState(() {
                  _isGlutenFree = value!;
                });
              }),
        ),
        ListTile(
          leading: Text('Lactose free'),
          trailing: Checkbox(
              value: _isLactoseFree,
              onChanged: (value) {
                setState(() {
                  _isLactoseFree = value!;
                });
              }),
        ),
        ListTile(
          leading: Text('Vegan'),
          trailing: Checkbox(
              value: _isVegan,
              onChanged: (value) {
                setState(() {
                  _isVegan = value!;
                });
              }),
        ),
        ListTile(
          leading: Text('Vegetarian'),
          trailing: Checkbox(
              value: _isVegetarian,
              onChanged: (value) {
                setState(() {
                  _isVegetarian = value!;
                });
              }),
        ),
        ElevatedButton(
            onPressed: () => () {
                  Map<String, bool> _filters = {
                    'gluten': _isGlutenFree,
                    'lactose': _isLactoseFree,
                    'vegan': _isVegan,
                    'vegetarian': _isVegetarian,
                  };
                  widget.saveFilters(_filters);
                },
            child: Text('Save'))
      ],
    );
  }
}
