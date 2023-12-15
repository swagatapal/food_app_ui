import 'package:flutter/material.dart';
import '../model/foodModel.dart';

class FoodItemWidget extends StatefulWidget {
  final FoodItem foodItem;
  FoodItemWidget({required this.foodItem});
  @override
  _FoodItemWidgetState createState() => _FoodItemWidgetState();
}

class _FoodItemWidgetState extends State<FoodItemWidget> {
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
            buildRightColumn(),
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
            widget.foodItem.name,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.foodItem.description,
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

  Widget buildRightColumn() {
    return Container(
      margin: EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          buildImageSection(),
          SizedBox(height: 10.0),
          buildCartButton(),
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
          widget.foodItem.imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildCartButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          widget.foodItem.addedToCart = true;
        });
      },
      style: ElevatedButton.styleFrom(
        primary: widget.foodItem.addedToCart ? Colors.green : Colors
            .white,
      ),
      child: Text(
        widget.foodItem.addedToCart ? 'Added' : 'Add',
        style: TextStyle(
            color: widget.foodItem.addedToCart ? Colors.white : Colors.red),
      ),
    );
  }
}
