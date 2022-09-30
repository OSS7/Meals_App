import 'package:flutter/material.dart';
import '../Dummy_Data.dart';
import '../Widgets/Category_Item.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
                  childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        children: DummyCategory.map((e) => CategoryItem(e.id??'',e.title??'', e.color??Colors.white24)).toList(),
      ),
    );
  }
}
