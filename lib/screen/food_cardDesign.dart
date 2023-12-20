import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/food_model.dart';
import '../model/food_provider.dart';

class FoodItemWidget extends StatelessWidget {
  final FoodItem foodItem;
  FoodItemWidget({required this.foodItem});
  @override
      Widget build(BuildContext context) {
        return Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          margin: EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(16.0),
            height: 190,
            child: Row(
              children: [
                buildLeftColumn(),
                buildRightColumn(context),
              ],
            ),
          ),
        );
      }

          Widget buildLeftColumn() {
            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.foodItem.name,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    this.foodItem.description,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.redAccent),
                      Icon(Icons.star, color: Colors.redAccent),
                      Icon(Icons.star, color: Colors.redAccent),
                      Icon(Icons.star, color: Colors.redAccent),
                      Icon(Icons.star_border),
                    ],
                  ),
                ],
              ),
            );
          }

          Widget buildRightColumn(BuildContext context) {
            return Container(
              margin: EdgeInsets.only(left: 16.0),
              child: Column(
                children: [
                  buildImageSection(),
                  SizedBox(height: 10.0),
                  buildCartButton(context),
                ],
              ),
            );
          }

          Widget buildImageSection() {
            return Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  this.foodItem.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }

          Widget buildCartButton(BuildContext context) {
            return ElevatedButton(
              onPressed: () {
              Provider.of<FoodProvider>(context, listen: false).addToCart(foodItem);
              },
              style: ElevatedButton.styleFrom(
                primary: this.foodItem.addedToCart ? Colors.green : Colors
                    .white,
              ),
              child: Text(
                this.foodItem.addedToCart ? 'Added' : 'Add',
                style: TextStyle(
                    color: this.foodItem.addedToCart ? Colors.white : Colors.red),
              ),
            );
          }
}
