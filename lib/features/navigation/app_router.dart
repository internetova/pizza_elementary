import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/test_start/test_start_screen.dart';

/// Навигация
abstract class AppRouter {
  static const String root = '/';

  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case AppRouter.root:
        return MaterialPageRoute<TestStartScreen>(
          builder: (_) => const TestStartScreen(),
        );
      default:
        return MaterialPageRoute<TestStartScreen>(
          builder: (_) => const TestStartScreen(),
        );
    }
  }
}
