import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/category-meals';

  final List<Meal> meals;

  const CategoryMealsScreen({Key key,@required this.meals}) : super(key: key);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  String categoryId;
  List<Meal> categoryMeals;
  @override
  void initState() {
    super.initState();
  }

  void removeMeal(String id) {
    setState(() {
      categoryMeals.removeWhere((Meal meal) => meal.id == id);
    });
  }

  @override
  void didChangeDependencies() {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = arguments['title'];
    categoryId = arguments['categoryId'];
    categoryMeals = widget.meals
        .where(
          (meal) => meal.categories.contains(categoryId),
        )
        .toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            meal: categoryMeals[index],
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
