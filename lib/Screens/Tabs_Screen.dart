import 'package:flutter/material.dart';
import 'package:store_app/Models/Meal.dart';
import 'package:store_app/Widgets/Drawer_Widget.dart';
import 'Category_Screen.dart';
import 'Favorite_Screen.dart';


class TabsScreen extends StatefulWidget {
  final List<Meal>? _favoriteMeal;
  const TabsScreen(this._favoriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _screen;
  int _selectedScreenIndex = 0;

  @override
  void initState() {
    _screen=[
      {'pages': CategoryScreen(), 'title': 'CategoryScreen'},
      {'pages': FavoriteScreen(widget._favoriteMeal!), 'title': 'FavoriteScreen'},
    ];
    super.initState();
  }

  _chooseScreen(int selectIndex) {
    setState(() {
      _selectedScreenIndex = selectIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BuildDrawer(),
      appBar: AppBar(
        title: Text(_screen[_selectedScreenIndex]['title']),
        backgroundColor: Colors.pink,
      ),
      body: _screen[_selectedScreenIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _chooseScreen,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), label: 'favorite'),
        ],
      ),
    );
  }
}
