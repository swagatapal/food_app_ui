import 'package:flutter/material.dart';
import 'food_model.dart';
import 'food_data.dart';

class FoodProvider extends ChangeNotifier {
  List<FoodItem> _foodItems = foodItems;
  List<FoodItem> get food => _foodItems;

  void addToCart(FoodItem foodItem) {
    foodItem.addedToCart = true;
    notifyListeners();
  }

  int getCartItemCount() {
    return _foodItems.where((item) => item.addedToCart).length;
  }
}
