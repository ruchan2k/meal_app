import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final ValueChanged<Map<String, bool>> setFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.setFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    
     _glutenFree =  widget.filters['gluten'] ?? false;
     _vegeterian = widget.filters['vegeterian'] ?? false;
     _vegan = widget.filters['vegan'] ?? false;
     _lactoseFree = widget.filters['lactose'] ?? false;

    super.initState();
  }

  Widget _buildSwitchTile(
    String title,
    String subTitle,
    bool currentValue,
    ValueChanged<bool> updateValue,
  ) =>
      SwitchListTile(
          title: Text(title),
          subtitle: Text(subTitle),
          value: currentValue,
          onChanged: updateValue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'vegeterian': _vegeterian,
                'vegan': _vegan,
                'lactose': _lactoseFree,
              };
              widget.setFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection.',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchTile(
                'Gluten-free',
                'Only gluten-free meals',
                _glutenFree,
                (value) => setState(
                      () => _glutenFree = value,
                    )),
            _buildSwitchTile(
                'Vegeterian-free',
                'Only vegeteriaan-free meals',
                _vegeterian,
                (value) => setState(
                      () => _vegeterian = value,
                    )),
            _buildSwitchTile(
                'Vegan-free',
                'Only vegan-free meals',
                _vegan,
                (value) => setState(
                      () => _vegan = value,
                    )),
            _buildSwitchTile(
                'Lactose-free',
                'Only lactose-free meals',
                _lactoseFree,
                (value) => setState(
                      () => _lactoseFree = value,
                    ))
          ],
        ))
      ]),
    );
  }
}
