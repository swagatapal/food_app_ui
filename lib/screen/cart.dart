// cart_page.dart
import 'package:flutter/material.dart';
import '../model/foodModel.dart';

class CartPage extends StatelessWidget {
  final List<FoodItem> cartItems;

  CartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    int itemCount = cartItems.where((item) => item.addedToCart).length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text(
          'Your cart has $itemCount items',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
