import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pizza_elementary/features/app/di/app_scope.dart';
import 'package:pizza_elementary/features/cart/constants/cart_strings.dart';
import 'package:pizza_elementary/features/cart/screens/cart_screen.dart';
import 'package:pizza_elementary/features/cart/screens/cart_screen_model.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/custom_pizza.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';
import 'package:pizza_elementary/util/money_formatter.dart';
import 'package:provider/provider.dart';

abstract class ICartScreenWidgetModel extends IWidgetModel {
  ThemeData get theme;

  ObservableList<CustomPizza> get cartList;

  PlatformWidgetsFactory get widgetsFactory;

  int get quantityInCart;

  int get totalCost;

  String getIngredients(Set<IngredientsType> ingredients);

  void removePizza(CustomPizza pizza);

  void clear();

  Future<void> makeOrder();
}

CartScreenWidgetModel defaultCartScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = CartScreenModel(
    appDependencies.errorHandler,
    appDependencies.cartStore,
    appDependencies.widgetsFactory,
  );

  return CartScreenWidgetModel(model);
}

/// Default widget model for CartScreenWidget
class CartScreenWidgetModel extends WidgetModel<CartScreen, CartScreenModel>
    implements ICartScreenWidgetModel {
  @override
  ThemeData get theme => Theme.of(context);

  @override
  ObservableList<CustomPizza> get cartList => model.cartList;

  @override
  PlatformWidgetsFactory get widgetsFactory => model.widgetsFactory;

  @override
  int get quantityInCart => model.quantityInCart;

  @override
  int get totalCost => model.totalCost;

  CartScreenWidgetModel(CartScreenModel model) : super(model);

  @override
  Future<void> removePizza(CustomPizza pizza) async {
    model.removePizza(pizza);
  }

  @override
  void clear() => model.clear();

  @override
  Future<void> makeOrder() async {
    final isYes = await widgetsFactory.openAlertDialog<bool>(
      context: context,
      builder: (_) => widgetsFactory.createAlertDialog(
        title: CartStrings.alertTitle,
        content:
            '$quantityInCart ${CartStrings.quantityPlural(quantityInCart)} ${CartStrings.forAmountOf} ${moneyFormatter.format(totalCost)}',
        titleLeftButton: CartStrings.alertTitleLeftButton,
        onLeftButton: () => Navigator.pop(context, false),
        titleRightButton: CartStrings.alertTitleRightButton,
        onRightButton: () => Navigator.pop(context, true),
      ),
    );

    /// Отправляем заказ
    if (isYes != null && isYes) {
      debugPrint('🟢-------- заказ отправлен');
      model.clear();
    } else {
      debugPrint('🔴-------- надо еще подумать');
    }
  }

  /// Получить список ингредиентов пиццы в виде форматированной строки
  @override
  String getIngredients(Set<IngredientsType> ingredients) {
    final buffer = StringBuffer();
    final ingredientsList = ingredients.toList();

    for (var i = 0; i < ingredientsList.length; i++) {
      var str = '';

      str = i == ingredientsList.length - 1
          ? '${ingredientsList[i].name} '
          : '${ingredientsList[i].name}, ';

      buffer.write(str);
    }

    return buffer.toString();
  }
}
