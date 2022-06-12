import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/app/screens/main/main_screen.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';
import 'package:pizza_elementary/features/pizza/screens/details/pizza_details_screen.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';
import 'package:pizza_elementary/features/test_start/test_start_screen.dart';

/// Навигация
abstract class AppRouter {
  static const String root = '/';
  static const String pizzaDetails = '/pizzaDetails';

  static Route<dynamic> generateRoute(
    RouteSettings settings,
    PlatformWidgetsFactory widgetsFactory,
  ) {
    switch (settings.name) {
      case AppRouter.root:
        return widgetsFactory.createPageRouter(
          builder: (_) => const MainScreen(),
        );
      case AppRouter.pizzaDetails:
        final arguments = settings.arguments as Map<String, dynamic>;
        final pizza = arguments['pizza'] as Pizza;

        return widgetsFactory.createPageRouter(
          builder: (_) => PizzaDetailsScreen(pizza: pizza),
        );
      default:
        return widgetsFactory.createPageRouter(
          builder: (_) => const TestStartScreen(),
        );
    }
  }
}
