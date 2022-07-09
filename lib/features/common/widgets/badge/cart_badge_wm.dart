import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/app/di/app_scope.dart';
import 'package:pizza_elementary/features/common/widgets/badge/cart_badge_model.dart';
import 'package:pizza_elementary/features/common/widgets/badge/cart_badge_widget.dart';
import 'package:provider/provider.dart';

abstract class ICartBadgeWidgetModel extends IWidgetModel {
  int get quantityInCart;
}

CartBadgeWidgetModel defaultCartBadgeWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = CartBadgeModel(
    appDependencies.errorHandler,
    appDependencies.cartStore,
  );

  return CartBadgeWidgetModel(model);
}

/// Default widget model for CartBadgeWidget
class CartBadgeWidgetModel extends WidgetModel<CartBadgeWidget, CartBadgeModel>
    implements ICartBadgeWidgetModel {
  @override
  int get quantityInCart => model.quantityInCart;

  CartBadgeWidgetModel(CartBadgeModel model) : super(model);
}
