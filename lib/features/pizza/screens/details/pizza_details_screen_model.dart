import 'package:elementary/elementary.dart';
import 'package:pizza_elementary/features/common/stores/cart_store.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/custom_pizza.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredient.dart';
import 'package:pizza_elementary/features/pizza/services/pizza_service.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';

/// Default Elementary model for PizzaDetailsScreen module
class PizzaDetailsScreenModel extends ElementaryModel {
  final PizzaService _pizzaService;
  final PlatformWidgetsFactory _widgetsFactory;
  final CartStore _cartStore;

  PlatformWidgetsFactory get widgetsFactory => _widgetsFactory;

  /// Количество в корзине
  int get quantityInCart => _cartStore.quantityInCart;

  PizzaDetailsScreenModel(
    ErrorHandler errorHandler,
    this._pizzaService,
    this._widgetsFactory,
    this._cartStore,
  ) : super(errorHandler: errorHandler);

  /// Получить список ингредиентов
  Future<List<Ingredient>> getPizzaIngredients() => _pizzaService.getPizzaIngredients();

  /// Добавить пиццу в корзину
  void addToCart(CustomPizza pizza) => _cartStore.addPizza(pizza);
}
