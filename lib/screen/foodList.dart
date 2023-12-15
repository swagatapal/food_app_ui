import 'package:flutter/material.dart';
import 'package:food_delivery_ui/screen/cart.dart';
import '../model/foodModel.dart';
import 'home.dart';
import '../model/food_data.dart';

class FoodListPage extends StatefulWidget {
  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  final List<FoodItem> _foodItems = foodItems;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Domino\'s Pizza',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                List<FoodItem> addedToCartItems = _foodItems.where((item) => item.addedToCart).toList();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage(cartItems: addedToCartItems)),
                );
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: _foodItems.length,
          itemBuilder: (context, index) {
            return FoodItemWidget(foodItem: _foodItems[index]);
          },
        ),
      ),
    );
  }
}