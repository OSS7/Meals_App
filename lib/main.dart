import 'package:flutter/material.dart';
import 'package:store_app/Dummy_Data.dart';
import 'package:store_app/Models/Meal.dart';
import 'package:store_app/Screens/Filters_Screen.dart';
import 'package:store_app/Screens/Tabs_Screen.dart';
import 'package:store_app/Screens/Category_Meals_Screen.dart';
import 'package:store_app/Screens/Filters_Screen.dart';
import 'package:store_app/Screens/Meal_Detail_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal>? _avaibleMeal = DUMMY_MEALS;
  List<Meal>? _favoriteMeal =[];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      _avaibleMeal = DUMMY_MEALS.where((meal) {
        if (_filter['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filter['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        if (_filter['vegan']! && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _favoriteToggle(String _mealId) {
    final _existingIndex =
        _favoriteMeal?.indexWhere((meal) => meal.id == _mealId);
    if (_existingIndex! >= 0) {
      setState(() {
        _favoriteMeal?.removeAt(_existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal
            ?.add(DUMMY_MEALS.firstWhere((element) => element.id == _mealId));
      });
    }
  }

  bool? _isFavorite(String id)
  {
    return _favoriteMeal?.any((element) => element.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favoriteMeal??[]),
        '/CategoryMealsScreen': (context) => CategoryMealsScreen(_avaibleMeal!),
        '/MealDetailScreen': (context) =>
            MealDetailScreen(_favoriteToggle, _isFavorite),
        '/FiltersScreen': (context) => FiltersScreen(_filter, _setFilter),
      },
    );
  }
}
