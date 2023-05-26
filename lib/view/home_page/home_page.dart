import 'package:e_commerce_app/riverpod/riverpod_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/product_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  final String _title = "Products";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var read = ref.read(productModelRiverpod);
    var watch = ref.watch(productModelRiverpod);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _homePageTitle(context),
            Expanded(
              child: ListView.builder(
                  itemCount: read.products.length,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  itemBuilder: ((context, index) {
                    return ProductWidget(
                        model: watch.products[index],
                        favFunc: () {
                          read.setFavorite(watch.products[index]);
                        },
                        basketFunc: () {
                          read.setBasket(watch.products[index]);
                        });
                  })),
            )
          ],
        ),
      ),
    );
  }

  Text _homePageTitle(BuildContext context) {
    return Text(
      _title,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
