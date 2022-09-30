import 'package:flutter/material.dart';
import 'package:store_app/Widgets/Meal_Item.dart';
import 'package:store_app/Models/Meal.dart';
class CategoryMealsScreen extends StatefulWidget {

  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals, {Key? key}) : super(key: key);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String? categorytitle;
  Color? categoryColor;
  String? categoryId;
  List<Meal>? displayMeal;
  var  _loadinginit=false;

  @override
  void didChangeDependencies(){
    if(!_loadinginit){
      final routeArgs= ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
      categorytitle=routeArgs['title'];
      categoryId=routeArgs['id'];
      categoryColor=routeArgs['color'];
      displayMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      } ).toList();
      _loadinginit=true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId){
    setState(() {
      displayMeal?.removeWhere((element) => element.id ==mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryId??''),
      ),
      body: ListView.builder(
        itemCount: displayMeal?.length,
          itemBuilder:(context,index){
        return MealItem(
          id: displayMeal![index].id,
          title: displayMeal![index].title,
          imageUrl: displayMeal![index].imageUrl,
          duration: displayMeal![index].duration,
          complexity: displayMeal![index].complexity,
          affordability: displayMeal![index].affordability,
        );
      }
      )
      );
  }
}
