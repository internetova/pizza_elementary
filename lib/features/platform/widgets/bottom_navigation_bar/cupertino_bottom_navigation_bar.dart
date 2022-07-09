import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pizza_elementary/features/common/constants/app_strings.dart';
import 'package:pizza_elementary/features/common/widgets/badge/cart_badge_widget.dart';

class CupertinoBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueSetter<int> onTap;

  const CupertinoBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      backgroundColor: Colors.transparent,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Ionicons.pizza_outline),
          label: AppStrings.bottomNavBarItemLabelHome,
        ),
        BottomNavigationBarItem(
          icon: CartBadgeWidget(),
          label: AppStrings.bottomNavBarItemLabelCart,
        ),
      ],
      onTap: onTap,
    );
  }
}
