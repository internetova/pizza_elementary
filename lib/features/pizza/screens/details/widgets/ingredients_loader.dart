import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';

/// Виджет для состояния загрузки списка ингредиентов
class IngredientsLoader extends StatelessWidget {
  final PlatformWidgetsFactory widgetsFactory;

  const IngredientsLoader({
    required this.widgetsFactory,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return widgetsFactory.createLoader();
  }
}
