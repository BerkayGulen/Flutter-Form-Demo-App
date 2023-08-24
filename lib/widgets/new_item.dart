import 'package:flutter/material.dart';
import 'package:flutter_form_demo/data/categories.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new item '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  return 'test...';
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: '1',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                        items: _buildDropdownItems(), onChanged: (value) {}),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
