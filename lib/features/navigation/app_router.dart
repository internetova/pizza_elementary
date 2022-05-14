import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/app/screens/main/main_screen.dart';
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
          builder: (_) => const MainScreen(),
        );
      default:
        return widgetsFactory.createPageRouter(
          builder: (_) => const TestStartScreen(),
        );
    }
  }
}
