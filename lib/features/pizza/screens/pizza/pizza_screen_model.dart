import 'package:elementary/elementary.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';
import 'package:pizza_elementary/features/pizza/services/pizza_service.dart';

/// Default Elementary model for PizzaScreen module
class PizzaScreenModel extends ElementaryModel {
  final PizzaService _pizzaService;

  PizzaScreenModel(
    ErrorHandler errorHandler,
    this._pizzaService,
  ) : super(errorHandler: errorHandler);

  /// Получить список пицц
  Future<List<Pizza>> getAllPizzas() => _pizzaService.getAllPizzas();
}
