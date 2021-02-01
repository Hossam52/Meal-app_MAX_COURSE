import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen({Key key, @required this.favoriteMeals}): super(key: key);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty)
      return Container(
        child: Center(
          child: Text('Empty'),
        ),
      );
      else{
        return  ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            meal: favoriteMeals[index],
          );
        },
        itemCount: favoriteMeals.length,
      );
      }
  }
}
