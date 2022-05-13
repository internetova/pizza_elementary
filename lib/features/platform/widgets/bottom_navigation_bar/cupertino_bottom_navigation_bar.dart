import 'package:flutter/cupertino.dart';
import 'package:pizza_elementary/features/common/constants/app_strings.dart';

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
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: AppStrings.bottomNavBarItemLabelHome,
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.shopping_cart),
          label: AppStrings.bottomNavBarItemLabelCart,
        ),
      ],
      onTap: onTap,
    );
  }
}
