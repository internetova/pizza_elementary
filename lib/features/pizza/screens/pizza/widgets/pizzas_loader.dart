import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';

/// Виджет для состояния загрузки пицц
class PizzasLoader extends StatelessWidget {
  final PlatformWidgetsFactory widgetsFactory;

  const PizzasLoader({
    required this.widgetsFactory,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return widgetsFactory.createLoader();
  }
}
