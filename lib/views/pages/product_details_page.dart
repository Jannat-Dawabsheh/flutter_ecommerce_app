import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.productItem});
  final ProductItemModel productItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          productItem.name,
        ),
      ),
    );
  }
}