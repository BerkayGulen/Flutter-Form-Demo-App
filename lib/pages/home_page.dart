import 'package:flutter/material.dart';
import 'package:flutter_form_demo/widgets/grocery_list.dart';
import 'package:flutter_form_demo/widgets/new_item.dart';

import '../model/grocery_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.push<GroceryItem>(
        context, MaterialPageRoute(builder: (ctx) => const NewItem()));
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item){
    int index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text("Grocery Removed"),
      action: SnackBarAction(
        label: 'undo',
        onPressed: () {
          setState(() {
            _groceryItems.insert(index, item);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text("no items added yet"));
    if(_groceryItems.isNotEmpty){
      content = GroceryList(_groceryItems,_removeItem);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: content
    );
  }
}
