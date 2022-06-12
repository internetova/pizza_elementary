import 'package:elementary/elementary.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredient.dart';
import 'package:pizza_elementary/features/pizza/services/pizza_service.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';

/// Default Elementary model for PizzaDetailsScreen module
class PizzaDetailsScreenModel extends ElementaryModel {
  final PizzaService _pizzaService;
  final PlatformWidgetsFactory _widgetsFactory;

  PlatformWidgetsFactory get widgetsFactory => _widgetsFactory;

  PizzaDetailsScreenModel(
    ErrorHandler errorHandler,
    this._pizzaService,
    this._widgetsFactory,
  ) : super(errorHandler: errorHandler);

  /// Получить список ингредиентов
  Future<List<Ingredient>> getPizzaIngredients() => _pizzaService.getPizzaIngredients();
}
