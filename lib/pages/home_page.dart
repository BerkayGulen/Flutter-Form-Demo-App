import 'package:flutter/material.dart';
import 'package:flutter_form_demo/widgets/grocery_list.dart';
import 'package:flutter_form_demo/widgets/new_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _addItem() {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => const NewItem()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: const GroceryList(),
    );
  }
}
