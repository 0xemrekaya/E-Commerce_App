import 'package:flutter/material.dart';

import 'product_model.dart';

class ProductModelRiverpod extends ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> favProducts = [];
  List<ProductModel> basketProducts = [];

  final String _url = "https://www.pngmart.com/files/16/Hand-Holding-Smartphone-PNG-Transparent-Image.png";

  void setFavorite(ProductModel model) {
    if (model.isFavorite == false) {
      model.isFavorite = true;
      favProducts.add(model);
    } else {
      model.isFavorite = false;
      favProducts.remove(model);
    }
    notifyListeners();
  }

    void setBasket(ProductModel model) {
    if (model.isBasket == false) {
      model.isBasket = true;
      basketProducts.add(model);
      

    } else {
      model.isBasket = false;
      basketProducts.remove(model);
      
    }
    notifyListeners();
  }

  void init() {
    for (var i = 0; i < 5; i++) {
      products.add(ProductModel(title: "Samsung A${i + 1}", description: "${i + 4}MB Camera, ${i + 1}GB RAM", imagePath: _url, price: i * 10 + 50, isFavorite: false, isBasket: false));
    }
  }
}
