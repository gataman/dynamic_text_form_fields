import 'package:flutter/material.dart';

import 'model/product_variations.dart';
import 'widgets/product_variations_list_item.dart';

class ProductVariationsListWidget extends StatefulWidget {
  const ProductVariationsListWidget({super.key});

  @override
  State<ProductVariationsListWidget> createState() => _ProductVariationsListWidgetState();
}

class _ProductVariationsListWidgetState extends State<ProductVariationsListWidget> {
  late final List<ProductVariations> _productVariationsList;

  @override
  void initState() {
    _productVariationsList = []; // Boş bir liste oluşturuldu.
    _productVariationsList.add(ProductVariations()); // ilk satır dolu olması için bir item eklendi.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _listWidget()),
            ElevatedButton(
              onPressed: () {
                _saveList();
              },
              child: const Text('Save List'),
            ),
          ],
        ),
      ),
    );
  }

  ListView _listWidget() {
    return ListView.builder(
      itemBuilder: (context, index) {
        final productVariations = _productVariationsList[index];
        return ProductVariationsListItem(
          // Şu oluşturulan alt widget key olması lazım yoksa herhangi bir itemder deyip siliyor.
          key: ObjectKey(productVariations),
          productVariations: productVariations,
          onAddItemClicked: () {
            setState(() {
              _productVariationsList.add(ProductVariations());
            });
          },
          onDeleteItemClicked: (ProductVariations productVariations) {
            setState(() {
              _productVariationsList.remove(productVariations);
            });
          },
        );
      },
      itemCount: _productVariationsList.length,
    );
  }

  void _saveList() {
    debugPrint(_productVariationsList.toString());
  }
}
