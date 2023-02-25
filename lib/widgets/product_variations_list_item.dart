import 'package:flutter/material.dart';

import '../model/product_variations.dart';

class ProductVariationsListItem extends StatelessWidget {
  const ProductVariationsListItem({super.key, required this.productVariations, required this.onAddItemClicked});

  final ProductVariations productVariations;
  final VoidCallback onAddItemClicked;

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
}
