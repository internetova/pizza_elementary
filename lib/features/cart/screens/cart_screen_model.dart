import 'package:elementary/elementary.dart';
import 'package:mobx/mobx.dart';
import 'package:pizza_elementary/features/common/stores/cart_store.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/custom_pizza.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';

/// Default Elementary model for CartScreen module
class CartScreenModel extends ElementaryModel {
  final CartStore _cartStore;
  final PlatformWidgetsFactory _widgetsFactory;

  PlatformWidgetsFactory get widgetsFactory => _widgetsFactory;

  ObservableList<CustomPizza> get cartList => _cartStore.cartList;

  int get quantityInCart => _cartStore.quantityInCart;

  int get totalCost => _cartStore.totalCost;

  CartScreenModel(
    ErrorHandler errorHandler,
    this._cartStore,
    this._widgetsFactory,
  ) : super(errorHandler: errorHandler);

  Future<ObservableList<CustomPizza>> getAllPizzas() =>
      Future<ObservableList<CustomPizza>>.value(_cartStore.cartList);

  void removePizza(CustomPizza pizza) => _cartStore.removePizza(pizza);

  void clear() => _cartStore.clear();
}
