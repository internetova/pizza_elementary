import 'package:elementary/elementary.dart';
import 'package:pizza_elementary/features/pizza/api/services/pizza_api.dart';
import 'package:pizza_elementary/features/pizza/api/services/pizza_api_mock.dart';
import 'package:pizza_elementary/features/pizza/domain/repository/pizza_repository.dart';
import 'package:pizza_elementary/features/pizza/services/pizza_service.dart';
import 'package:pizza_elementary/util/default_error_handler.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  late final ErrorHandler _errorHandler;

  late final PizzaApi _pizzaApi;
  late final PizzaRepository _pizzaRepository;
  late final PizzaService _pizzaService;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  @override
  PizzaService get pizzaService => _pizzaService;

  /// Create an instance [AppScope].
  AppScope() {
    _errorHandler = DefaultErrorHandler();

    _pizzaApi = PizzaApiMock();
    _pizzaRepository = PizzaRepository(_pizzaApi);
    _pizzaService = PizzaService(_pizzaRepository);
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Interface for handle error in business logic.
  ErrorHandler get errorHandler;

  PizzaService get pizzaService;
}
