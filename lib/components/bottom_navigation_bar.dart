import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/riverpod_management.dart';

class BottomNavigationBarWidget extends ConsumerWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(bottomNavBarRiverpod);
    var read = ref.read(bottomNavBarRiverpod);
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home Page"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite Page"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: "Basket Page")
      ],
      currentIndex: watch.currentIndex,
      onTap: (index) {
        read.setCurrentIndex(index);
      },
    );
  }
}
