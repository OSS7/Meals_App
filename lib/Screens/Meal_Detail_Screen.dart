import 'package:flutter/material.dart';
import 'package:store_app/Dummy_Data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function _favoriteToggle;
  final Function _isItFavorite;
  const MealDetailScreen(this._favoriteToggle, this._isItFavorite);

  Widget BuildSectiontitle(context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(text),
    );
  }

  Widget BuildContainer(Widget child) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:()=> _favoriteToggle(mealId),
        child: Icon(_isItFavorite(mealId) ? Icons.star : Icons.star_border),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(mealId),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(selectedMeal.imageUrl,fit: BoxFit.fitWidth,),
            ),
            BuildSectiontitle(context, "ingredeint"),
            BuildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(5),
                    color: Colors.blueAccent,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            BuildSectiontitle(context, "steps"),
            BuildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text("# ${index + 1}"),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
