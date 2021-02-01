import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final String imageUrl;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  final bool isLactoseFree;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.ingredients,
    @required this.steps,
    @required this.imageUrl,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.isLactoseFree,
    @required this.isGlutenFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
