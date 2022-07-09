import 'package:elementary/elementary.dart';
import 'package:pizza_elementary/features/common/stores/cart_store.dart';

/// Default Elementary model for CartBadge module
class CartBadgeModel extends ElementaryModel {
  final CartStore _cartStore;

  /// Количество в корзине
  int get quantityInCart => _cartStore.quantityInCart;

  CartBadgeModel(
    ErrorHandler errorHandler,
    this._cartStore,
  ) : super(errorHandler: errorHandler);
}
