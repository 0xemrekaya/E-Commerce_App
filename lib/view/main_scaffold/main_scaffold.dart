
import 'package:e_commerce_app/riverpod/riverpod_management.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/bottom_navigation_bar.dart';

class MainScaffold extends ConsumerStatefulWidget {
  const MainScaffold({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends ConsumerState<MainScaffold> {
  @override
  void initState() {
    ref.read(productModelRiverpod).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var watch = ref.watch(bottomNavBarRiverpod);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          watch.currentTitle(),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      body: watch.currentWidget(),
    );
  }
}

