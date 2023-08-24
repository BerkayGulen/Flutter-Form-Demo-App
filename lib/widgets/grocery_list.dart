import 'package:flutter/material.dart';
import 'package:flutter_form_demo/data/dummy_items.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (ctx, index) => ListTile(
        title: Text(groceryItems[index].name),
        leading: Container(
          width: 25,
          height: 25,
          color: groceryItems[index].category.color,
        ),
        trailing:Text( groceryItems[index].quantity.toString()),

      ),
    );
  }
}
