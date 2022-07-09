import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:pizza_elementary/features/common/stores/cart_store.dart';
import 'package:pizza_elementary/features/pizza/api/services/pizza_api.dart';
import 'package:pizza_elementary/features/pizza/api/services/pizza_api_mock.dart';
import 'package:pizza_elementary/features/pizza/domain/repository/pizza_repository.dart';
import 'package:pizza_elementary/features/pizza/services/pizza_service.dart';
import 'package:pizza_elementary/features/platform/factory/cupertino_widgets_factory.dart';
import 'package:pizza_elementary/features/platform/factory/material_widgets_factory.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';
import 'package:pizza_elementary/util/default_error_handler.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  late final ErrorHandler _errorHandler;
  late final PlatformWidgetsFactory _widgetsFactory;

  late final PizzaApi _pizzaApi;
  late final PizzaRepository _pizzaRepository;
  late final PizzaService _pizzaService;

  late final CartStore _cartStore;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  @override
  PlatformWidgetsFactory get widgetsFactory => _widgetsFactory;

  @override
  PizzaService get pizzaService => _pizzaService;

  @override
  CartStore get cartStore => _cartStore;

  /// Create an instance [AppScope].
  AppScope() {
    PlatformWidgetsFactory _createPlatformWidgetsFactory() {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return const MaterialWidgetsFactory();
        case TargetPlatform.iOS:
          return const CupertinoWidgetsFactory();
        default:
          return const MaterialWidgetsFactory();
      }
    }

    _errorHandler = DefaultErrorHandler();
    _widgetsFactory = _createPlatformWidgetsFactory();

    _pizzaApi = PizzaApiMock();
    _pizzaRepository = PizzaRepository(_pizzaApi);
    _pizzaService = PizzaService(_pizzaRepository);

    _cartStore = CartStore();
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Interface for handle error in business logic.
  ErrorHandler get errorHandler;

  PlatformWidgetsFactory get widgetsFactory;

  PizzaService get pizzaService;

  CartStore get cartStore;
}
