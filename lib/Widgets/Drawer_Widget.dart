import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuildDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget BuildListTile(String title,IconData icon,Function() OnTap){
      return ListTile(
        leading: Icon(icon),
        title: Text(title,textAlign: TextAlign.center,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
        onTap: OnTap
      );
    }
    return Drawer(
      child: Column(
        children: [
        Container(height: 180,width: double.infinity,padding: const EdgeInsets.all(50),
        child: const Text("Cooking up!"
          ,textAlign: TextAlign.center
          , style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,color: Colors.black45),
        ),
          color: Colors.teal,),
          const SizedBox(height: 30,),
          BuildListTile('Meals', Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          BuildListTile('filter', Icons.settings,(){
            Navigator.of(context).pushReplacementNamed('/FiltersScreen');
          }),
      ],
      ),
    );
  }
}
