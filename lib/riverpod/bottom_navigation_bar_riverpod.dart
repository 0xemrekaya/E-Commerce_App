import 'package:flutter/material.dart';

import '../view/basket_page/basket_page.dart';
import '../view/favorite_page/favorite_page.dart';
import '../view/home_page/home_page.dart';

class BottomNavigationBarRiverpod extends ChangeNotifier {
  int currentIndex = 0;
  String title = "";

  void setCurrentIndex(int index) {
    currentIndex = index;

    notifyListeners();
  }

  Widget currentWidget() {
    switch (currentIndex) {
      case 0:
        title = "Home Page";
        return const HomePage();
      case 1:
        title = "Favorite Page";
        return const FavoritePage();
      case 2:
        title = "Basket Page";
        return const BasketPage();
      default:
        title = "Home Page";
        return const HomePage();
    }
  }

  String currentTitle() {
    switch (currentIndex) {
      case 0:
        return title = "Home Page";
      case 1:
        return title = "Favorite Page";
      case 2:
        return title = "Basket Page";
      default:
        return title = "Home Page";
    }
  }
}
