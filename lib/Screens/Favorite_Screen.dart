import 'package:flutter/material.dart';
import 'package:store_app/Models/Meal.dart';
import 'package:store_app/Widgets/Meal_Item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal>? _favoriteMeal;
  const FavoriteScreen(this._favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if(_favoriteMeal!.isEmpty){
      return const Center(child: Text('nothig is mark as favorite , just mark something as favorite'),);
    }else{
      return ListView.builder(
          itemCount: _favoriteMeal!.length,
          itemBuilder:(context,index){
            return MealItem(
              id: _favoriteMeal![index].id,
              title: _favoriteMeal![index].title,
              imageUrl: _favoriteMeal![index].imageUrl,
              duration: _favoriteMeal![index].duration,
              complexity: _favoriteMeal![index].complexity,
              affordability: _favoriteMeal![index].affordability,
            );
          }
      );
    }
  }
}
