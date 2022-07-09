import 'package:badges/badges.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pizza_elementary/features/common/widgets/badge/cart_badge_wm.dart';

/// Бейдж с количеством для корзины
class CartBadgeWidget extends ElementaryWidget<ICartBadgeWidgetModel> {
  const CartBadgeWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultCartBadgeWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICartBadgeWidgetModel wm) {
    return Observer(
      builder: (_) {
        return Badge(
          showBadge: wm.quantityInCart > 0,
          position: BadgePosition.topEnd(top: -4, end: -4),
          badgeColor: Colors.deepOrangeAccent,
          badgeContent: Text(
            wm.quantityInCart.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          child: const Icon(Ionicons.cart_outline),
          toAnimate: false,
        );
      },
    );
  }
}
