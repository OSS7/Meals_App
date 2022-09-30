import 'package:flutter/material.dart';
import 'package:store_app/Widgets/Drawer_Widget.dart';

class FiltersScreen extends StatefulWidget {

  final Function setFilter;
  Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.setFilter, {Key? key}) : super(key: key);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool lactoseFree = false;
  bool vegetarian = false;
  bool vegan = false;

  Widget _buildSwitchListTile(
      {required String title,
        required String description,
        required bool currentValue,
        required Function(bool)? updateState}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateState,
    );
  }

  @override
  void initState() {
    glutenFree = widget.currentFilters['gluten']!;
    lactoseFree = widget.currentFilters['lactose']!;
    vegetarian = widget.currentFilters['vegetarian']!;
    vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BuildDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final selectedFilter = {
                  'gluten': glutenFree,
                  'lactose': lactoseFree,
                  'vegetarian': vegetarian,
                  'vegan': vegan,
                };
                widget.setFilter(selectedFilter);
              }),
        ],
        title: const Text('FiltersScreen'),
      ),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "Adjust your meal selection.",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              )),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  title: "is Gluten-Free",
                  description: "only including gluten-free meal.",
                  currentValue: glutenFree,
                  updateState: (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  }),
              _buildSwitchListTile(
                  title: "is Lactose-Free",
                  description: "only including Lactose-Free meal.",
                  currentValue: lactoseFree,
                  updateState: (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  }),
              _buildSwitchListTile(
                  title: "is vegetarian",
                  description: "only including vegetarian meal.",
                  currentValue: vegetarian,
                  updateState: (newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  }),
              _buildSwitchListTile(
                  title: "is vegan",
                  description: "only including vegan meal.",
                  currentValue: vegan,
                  updateState: (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
