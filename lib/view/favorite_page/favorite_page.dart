import 'package:e_commerce_app/model/product_model_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/product_widget.dart';
import '../../riverpod/riverpod_management.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});
  final String _title = "Favorite Page";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var read = ref.read(productModelRiverpod);
    var watch = ref.watch(productModelRiverpod);
    return Scaffold(
      body: watch.favProducts.isEmpty ? listEmptyWidget(context, ref) : favModelWidget(context, watch, read),
    );
  }

  Padding favModelWidget(BuildContext context, ProductModelRiverpod watch, ProductModelRiverpod read) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _homePageTitle(context),
          Expanded(
            child: ListView.builder(
                itemCount: watch.favProducts.length,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                itemBuilder: ((context, index) {
                  return ProductWidget(
                      model: watch.favProducts[index],
                      favFunc: () {
                        read.setFavorite(watch.favProducts[index]);
                      },
                      basketFunc: () {read.setBasket(watch.favProducts[index]);});
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
