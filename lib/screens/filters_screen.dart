import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> filters;
  final Function saveData;
  const FiltersScreen(
      {Key key, @required this.filters, @required this.saveData})
      : super(key: key);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  initState() {
    _glutenFree = widget.filters['gluten'];
    _lactoseFree = widget.filters['lactose'];
    _vegiterian = widget.filters['vegiterian'];
    _vegan = widget.filters['vegan'];
    super.initState();
  }

  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegiterian = false;
  bool _vegan = false;

  Widget _buildSwitchListTile(
      String title, String subtitle, bool value, Function onChanged) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: TextStyle(fontSize: 25),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your favorites'), actions: [
        IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Map<String, bool> newFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegiterian': _vegiterian,
                'vegan': _vegan,
              };
              widget.saveData(newFilters);
            }),
      ]),
      drawer: MainDrawer(selectedIndex: 1,),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          _buildSwitchListTile('Gluten-Free', 'Only include Gluten-Free meals.',
              _glutenFree, (value) => setState(() => _glutenFree = value)),
          _buildSwitchListTile(
              'Lactose-Free',
              'Only include Lactose-Free meals.',
              _lactoseFree,
              (value) => setState(() => _lactoseFree = value)),
          _buildSwitchListTile('_vegiterian', 'Only include _vegiterian meals.',
              _vegiterian, (value) => setState(() => _vegiterian = value)),
          _buildSwitchListTile('_vegan', 'Only include Vegi meals.', _vegan,
              (value) => setState(() => _vegan = value)),
        ],
      ),
    );
  }
}
