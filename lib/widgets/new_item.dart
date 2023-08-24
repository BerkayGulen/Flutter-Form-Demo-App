import 'package:flutter/material.dart';
import 'package:flutter_form_demo/data/categories.dart';
import 'package:flutter_form_demo/model/grocery_item.dart';

import '../model/category.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  List<DropdownMenuItem<Category>> _buildDropdownItems() {
    return categories.values.map((category) {
      return DropdownMenuItem(
        value: category,
        child: Row(
          children: [
            Container(
              width: 16,
              height: 16,
              color: category.color,
            ),
            const SizedBox(width: 6),
            Text(category.title),
          ],
        ),
      );
    }).toList();
  }

  final _formKey = GlobalKey<FormState>();
  String _enteredName = "";
  int _enteredQuantity = 0;
  Category _selectedCategory = categories[Categories.fruit]!;

  void _saveItem() {
    var validate = _formKey.currentState!.validate();
    if (validate) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(GroceryItem(
          id: DateTime.now().toString(),
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new item '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'must be between 1 and 50 characters';
                  }
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'must be a valid number';
                        }
                      },
                      onSaved: (value) {
                        _enteredQuantity = int.tryParse(value!)!;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                        value: _selectedCategory,
                        items: _buildDropdownItems(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value!;
                          });
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: Text("Reset")),
                  ElevatedButton(onPressed: _saveItem, child: Text("Add Item")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
