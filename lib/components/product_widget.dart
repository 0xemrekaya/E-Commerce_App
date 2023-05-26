import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../model/product_model_riverpod.dart';
import '../riverpod/riverpod_management.dart';
import '../widgets/text_icon_button.dart';

class ProductWidget extends ConsumerWidget {
  const ProductWidget({required this.model, required this.favFunc, required this.basketFunc, super.key});
  final ProductModel model;
  final Function favFunc;
  final Function basketFunc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productModelRiverpod);
    var read = ref.read(productModelRiverpod);
    return Stack(children: [
      cardWidget(watch, context, ref),
      favIconButton(watch, read),
    ]);
  }

  Card cardWidget(ProductModelRiverpod watch, BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      shadowColor: Colors.blueGrey,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageWidget(watch),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                titleText(watch, context),
                descriptionText(watch, context),
                priceText(watch, context),
                TextIconButtonWidget(
                  basketFunc: basketFunc,
                  icon: model.isBasket ? const Icon(Icons.shopping_bag) : const Icon(Icons.shopping_bag_outlined),
                  text: model.isBasket ? "Remove from Basket" : "Add to Basket",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Align imageWidget(ProductModelRiverpod watch) {
    return Align(
      child: Image.network(height: 250, width: 150, model.imagePath),
    );
  }

  Align favIconButton(ProductModelRiverpod watch, ProductModelRiverpod read) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 5),
        ], color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 0)),
        child: iconButton(watch, read),
      ),
    );
  }

  Padding priceText(ProductModelRiverpod watch, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '\$' + model.price.toString(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 20),
      ),
    );
  }

  Padding descriptionText(ProductModelRiverpod watch, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        model.description,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
      ),
    );
  }

  Padding titleText(ProductModelRiverpod watch, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Text(
        model.title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 30),
      ),
    );
  }

  IconButton iconButton(ProductModelRiverpod watch, ProductModelRiverpod read) {
    return IconButton(
      icon: model.isFavorite ? favIcon() : borderFavIcon(),
      onPressed: () {
        favFunc();
      },
    );
  }
 


  Icon borderFavIcon() {
    return const Icon(
      size: 30,
      Icons.favorite_border,
    );
  }

  Icon favIcon() {
    return const Icon(
      size: 30,
      Icons.favorite,
    );
  }
}
