import 'package:flutter/material.dart';

import '../model/product_variations.dart';

class ProductVariationsListItem extends StatelessWidget {
  const ProductVariationsListItem(
      {super.key, required this.productVariations, required this.onAddItemClicked, required this.onDeleteItemClicked});

  final ProductVariations productVariations;
  final VoidCallback onAddItemClicked;
  final Function(ProductVariations productVariations) onDeleteItemClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          _titleTextFormField(),
          const SizedBox(width: 8),
          _valueTextFormField(),
          const SizedBox(width: 8),
          _addButton(),
          const SizedBox(width: 8),
          _deleteButton(),
        ],
      ),
    );
  }

  Widget _titleTextFormField() {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: TextFormField(
          decoration: InputDecoration(
            label: const Text('Adı'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          initialValue: productVariations.title ?? '',
          onChanged: (value) {
            productVariations.title = value;
          },
        ),
      ),
    );
  }

  Widget _valueTextFormField() {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: TextFormField(
          decoration: InputDecoration(
            label: const Text('Değeri'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          initialValue: productVariations.value ?? '',
          onChanged: (value) {
            productVariations.value = value;
          },
        ),
      ),
    );
  }

  Widget _addButton() {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onAddItemClicked,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _deleteButton() {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          onDeleteItemClicked(productVariations);
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
