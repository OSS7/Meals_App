import 'package:flutter/material.dart';


class CategoryItem extends StatelessWidget {
  String id;
  String title;
  Color color;
  
  CategoryItem(this.id,this.title,this.color, {Key? key}) : super(key: key);

  void CategoryScreen(BuildContext ctx){
    Navigator.of(ctx).pushNamed('/CategoryMealsScreen',
        arguments: {'id' : id, 'title': title, 'color': color});
  }
  @override 
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> CategoryScreen(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(title,),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
