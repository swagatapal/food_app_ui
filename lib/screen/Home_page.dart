import 'package:flutter/material.dart';
import 'package:food_delivery_ui/screen/cart_list.dart';
import 'package:provider/provider.dart';
import '../model/food_model.dart';
import '../model/food_provider.dart';
import 'food_cardDesign.dart';


class FoodListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var foodProvider = Provider.of<FoodProvider>(context);
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
                List<FoodItem> addedToCartItems =
                Provider.of<FoodProvider>(context, listen: false)
                    .food
                    .where((item) => item.addedToCart)
                    .toList();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cartItems: addedToCartItems),
                  ),
                );
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: foodProvider.food.length,
          itemBuilder: (context, index) {
            return FoodItemWidget(foodItem: foodProvider.food[index]);
          },
        ),
      ),
    );
  }

}