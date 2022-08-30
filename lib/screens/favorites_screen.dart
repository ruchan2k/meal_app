import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  List<Meal> favoritedMeals;
  FavoritesScreen(this.favoritedMeals);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TheCategoryItem'),
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return MealItem(
              id: widget.favoritedMeals[index].id,
              title: widget.favoritedMeals[index].title,
              imageUrl: widget.favoritedMeals[index].imageUrl,
              duration: widget.favoritedMeals[index].duration,
              complexity: widget.favoritedMeals[index].complexity,
              affordability: widget.favoritedMeals[index].affordability,
            );
          }),
          itemCount: widget.favoritedMeals.length,
        ));
  }
}
