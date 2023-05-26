class ProductModel {
  String title;
  String description;
  String imagePath;
  double price;
  bool isFavorite;
  bool isBasket;
  ProductModel({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.isFavorite,
    required this.isBasket,
  });
}
