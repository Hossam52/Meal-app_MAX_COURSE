import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetail extends StatelessWidget {
  static const String routeName = '/meal-detail';
  final Function(String) markFavorite;
  final Function(String) getFavorite;

  const MealDetail(
      {Key key, @required this.markFavorite, @required this.getFavorite})
      : super(key: key);
  Widget _buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.headline6),
    );
  }

  Widget _buildListView(Widget listView) {
    return Container(
        height: 250,
        width: 300,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(15)),
        child: listView);
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            _buildSectionTitle(context, "Ingeridents"),
            _buildListView(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (_, index) => Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    meal.ingredients[index],
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
            _buildSectionTitle(context, 'Steps'),
            _buildListView(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (_, index) => Column(
                  children: [
                    Divider(),
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(
                        meal.steps[index],
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () => markFavorite(meal.id),
        child:
            getFavorite(meal.id) ? Icon(Icons.star) : Icon(Icons.star_border),
      ),
    );
  }
}
