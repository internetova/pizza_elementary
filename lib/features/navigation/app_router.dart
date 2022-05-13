import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/pizza/screens/pizza/pizza_screen.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';
import 'package:pizza_elementary/features/test_start/test_start_screen.dart';

/// Навигация
abstract class AppRouter {
  static const String root = '/';

  static Route<dynamic> generateRoute(
    RouteSettings settings,
    PlatformWidgetsFactory widgetsFactory,
  ) {
    switch (settings.name) {
      case AppRouter.root:
        return widgetsFactory.createPageRouter(
          builder: (_) => const PizzaScreen(),
        );
      default:
        return widgetsFactory.createPageRouter(
          builder: (_) => const TestStartScreen(),
        );
    }
  }
}
