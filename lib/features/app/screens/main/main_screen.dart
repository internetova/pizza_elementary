import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/app/screens/main/main_screen_wm.dart';
import 'package:pizza_elementary/features/cart/screens/cart_screen.dart';
import 'package:pizza_elementary/features/pizza/screens/pizza/pizza_screen.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';

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
          bottomNavigationBar: _BottomNavigationBar(
            widgetsFactory: wm.widgetsFactory,
            currentIndex: data ?? 0,
            switchTab: wm.switchTab,
          ),
        );
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final PlatformWidgetsFactory widgetsFactory;
  final int currentIndex;
  final ValueSetter<int> switchTab;

  const _BottomNavigationBar({
    Key? key,
    required this.widgetsFactory,
    required this.currentIndex,
    required this.switchTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return widgetsFactory.createBottomNavigationBar(
      currentIndex: currentIndex,
      onTap: switchTab,
    );
  }
}
