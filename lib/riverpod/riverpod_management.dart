import 'package:e_commerce_app/model/product_model_riverpod.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bottom_navigation_bar_riverpod.dart';

final bottomNavBarRiverpod =
    ChangeNotifierProvider<BottomNavigationBarRiverpod>((ref) => BottomNavigationBarRiverpod());
final productModelRiverpod = ChangeNotifierProvider<ProductModelRiverpod>((ref) => ProductModelRiverpod());

