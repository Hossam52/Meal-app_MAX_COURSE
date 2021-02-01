import 'package:flutter/material.dart';

import './screens/cateogry_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './models/meal.dart';
import './dummy_data.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegiterian': false,
    'vegan': false,
  };
  List<Meal> filteredMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];
  void setFilters(Map<String, bool> newFilters) {
    setState(() {
      filters = newFilters;

      filteredMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) return false;
        if (filters['lactose'] && !meal.isLactoseFree) return false;
        if (filters['vegiterian'] && !meal.isVegetarian) return false;
        if (filters['vegan'] && !meal.isVegan) return false;
        return true;
      }).toList();
    });
  }

  void togleFavorite(String id) {
    final int exisitingIndex =
        favoriteMeals.indexWhere((meal) => meal.id == id);
    setState(() {
      if (exisitingIndex != -1)
        favoriteMeals.removeAt(exisitingIndex);
      else {
        final Meal m = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
        favoriteMeals.add(m);
      }
    });
  }
  bool getFavorite(String id){
    return favoriteMeals.any((meal) => meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromARGB(255, 255, 255, 255),
        fontFamily: 'Releway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              headline6: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
              ),
            ),
      ),
      //home: CategoriesScreen(),
      routes: {
        '/': (_) => TabsScreen(favoriteMeals: favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(meals: filteredMeals),
        MealDetail.routeName: (_) => MealDetail(getFavorite: getFavorite, markFavorite: togleFavorite,),
        FiltersScreen.routeName: (_) =>
            FiltersScreen(filters: filters, saveData: setFilters),
      },
    );
  }
}
