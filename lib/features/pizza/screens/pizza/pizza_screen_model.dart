import 'package:elementary/elementary.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';
import 'package:pizza_elementary/features/pizza/services/pizza_service.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';

/// Default Elementary model for PizzaScreen module
class PizzaScreenModel extends ElementaryModel {
  final PizzaService _pizzaService;
  final PlatformWidgetsFactory _widgetsFactory;

  PlatformWidgetsFactory get widgetsFactory => _widgetsFactory;

  PizzaScreenModel(
    ErrorHandler errorHandler,
    this._pizzaService,
    this._widgetsFactory,
  ) : super(errorHandler: errorHandler);

  /// Получить список пицц
  Future<List<Pizza>> getAllPizzas() => _pizzaService.getAllPizzas();

}
