import 'package:e_commerce_app/view/main_scaffold/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter E-Commerce App',
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
            toolbarHeight: 50,
            centerTitle: true,
            titleTextStyle: Theme.of(context).textTheme.headlineSmall,
            color: Colors.blueGrey,
            elevation: 5,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)))),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
        ),
        useMaterial3: true,
      ),
      home: const MainScaffold(),
    );
  }
}
// anikmation yapılacak basket ve fav sayaları için ürün kalkerken. sorunsuz herşey çalışıyor.