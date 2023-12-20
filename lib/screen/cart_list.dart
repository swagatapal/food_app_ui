import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/food_model.dart';
import '../model/food_provider.dart';

class CartPage extends StatelessWidget {
  final List<FoodItem> cartItems;
  CartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    int itemCount = Provider.of<FoodProvider>(context).getCartItemCount();

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
