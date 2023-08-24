import 'package:flutter/material.dart';

import '../model/grocery_item.dart';

class GroceryList extends StatelessWidget {
  const GroceryList(this._groceryItems,this._removeItem,{super.key});

  final List<GroceryItem> _groceryItems;
  final Function(GroceryItem groceryItem) _removeItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _groceryItems.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(_groceryItems[index].id),
        onDismissed: (direction){
          _removeItem(_groceryItems[index]);
        },
        child: ListTile(
          title: Text(_groceryItems[index].name),
          leading: Container(
            width: 25,
            height: 25,
            color: _groceryItems[index].category.color,
          ),
          trailing:Text( _groceryItems[index].quantity.toString()),

        ),
      ),
    );
  }
}
