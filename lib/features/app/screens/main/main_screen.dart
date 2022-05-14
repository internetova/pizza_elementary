import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/app/screens/main/main_screen_wm.dart';
import 'package:pizza_elementary/features/cart/screens/cart_screen.dart';
import 'package:pizza_elementary/features/pizza/screens/pizza/pizza_screen.dart';

/// Main widget for MainScreen module
class MainScreen extends ElementaryWidget<IMainScreenWidgetModel> {
  const MainScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultMainScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IMainScreenWidgetModel wm) {
    return StateNotifierBuilder<int>(
      listenableState: wm.tabState,
      builder: (_, data) {
        return Scaffold(
          body: IndexedStack(
            index: data,
            children: const [
              PizzaScreen(),
              CartScreen(),
            ],
          ),
          bottomNavigationBar: wm.bottomNavigationBar,
        );
      },
    );
  }
}
