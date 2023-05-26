
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/product_widget.dart';
import '../../model/product_model_riverpod.dart';
import '../../riverpod/riverpod_management.dart';

class BasketPage extends ConsumerWidget {
  const BasketPage({super.key});
  final String _title = "Basket Page";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var read = ref.read(productModelRiverpod);
    var watch = ref.watch(productModelRiverpod);
    return Scaffold(

      body: watch.basketProducts.isEmpty ? listEmptyWidget(context, ref) : basketWidget(context, watch, read),
    );
  }

  Padding basketWidget(BuildContext context, ProductModelRiverpod watch, ProductModelRiverpod read) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _homePageTitle(context),
          Expanded(
            child: ListView.builder(
                itemCount: watch.basketProducts.length,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                itemBuilder: ((context, index) {
                  return ProductWidget(
                      model: watch.basketProducts[index],
                      favFunc: () {
                        read.setFavorite(watch.basketProducts[index]);
                      },
                      basketFunc: () {
                        read.setBasket(watch.basketProducts[index]);
                      });
                })),
          )
        ],
      ),
    );
  }

  Center listEmptyWidget(context, WidgetRef ref) {
    const listEmptyText = "List is empty.";
    const goHomePage = "Go back Home Page";
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 100.0),
      child: Column(
        children: [
          Text(listEmptyText, style: Theme.of(context).textTheme.headlineLarge),
          TextButton.icon(
            onPressed: () {
              ref.read(bottomNavBarRiverpod).setCurrentIndex(0);
            },
            label: const Text(goHomePage),
            icon: const Icon(Icons.home_outlined),
          )
        ],
      ),
    ));
  }

  Text _homePageTitle(BuildContext context) {
    return Text(
      _title,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
