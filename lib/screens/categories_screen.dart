import 'package:flutter/material.dart';

import '../widgets/cateogry_item.dart';
import '../dummy_data.dart';
import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding:const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (Category category) => CategoryItem(
                categoryId: category.id,
                title: category.title,
                backgroundColor: category.backgroundColor,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2),
      );
  }
}
