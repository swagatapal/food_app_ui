class FoodItem {
  final String name;
  final String description;
  final double rating;
  final String imagePath;
  bool addedToCart;

  FoodItem({
    required this.name,
    required this.description,
    required this.rating,
    required this.imagePath,
    this.addedToCart = false,
  });
}
