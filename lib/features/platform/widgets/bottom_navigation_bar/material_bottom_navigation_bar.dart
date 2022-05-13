import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/common/constants/app_strings.dart';

class MaterialBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueSetter<int> onTap;

  const MaterialBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppStrings.bottomNavBarItemLabelHome,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: AppStrings.bottomNavBarItemLabelCart,
        ),
      ],
      onTap: onTap,
    );
  }
}
