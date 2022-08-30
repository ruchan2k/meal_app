import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoritedMeals;

  TabsScreen(this.favoritedMeals);

  @override
  State<TabsScreen> createState() => _TabsScreen();
}

class _TabsScreen extends State<TabsScreen> {
  int _pageIndex = 0;
  List<Map<String, Object>> _pages = [];

  @override
  void initState() {
    _pages = [
      {'widget': CategoriesScreen(), 'title': 'Categories'},
      {'widget': FavoritesScreen(widget.favoritedMeals), 'title': 'Favorities'},
    ];
    super.initState();
  }

  void _selectPage(int index) => setState(() {
        _pageIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text(_pages[_pageIndex]['title'] as String)),
        drawer: MainDrawer(),
        body: _pages[_pageIndex]['widget'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amberAccent,
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _pageIndex,
        ),
      ),
    );
  }
}
