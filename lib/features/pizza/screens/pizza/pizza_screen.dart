import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';
import 'package:pizza_elementary/features/pizza/screens/pizza/pizza_screen_wm.dart';
import 'package:pizza_elementary/features/pizza/screens/pizza/widgets/pizzas_builder.dart';
import 'package:pizza_elementary/features/pizza/screens/pizza/widgets/pizzas_error.dart';
import 'package:pizza_elementary/features/pizza/screens/pizza/widgets/pizzas_loader.dart';

/// Main widget for PizzaScreen module
class PizzaScreen extends ElementaryWidget<IPizzaScreenWidgetModel> {
  const PizzaScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultPizzaScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPizzaScreenWidgetModel wm) {
    return Scaffold(
      appBar: wm.appBar,
      body: EntityStateNotifierBuilder<List<Pizza>>(
        listenableEntityState: wm.pizzaState,
        loadingBuilder: (_, __) {
          return PizzasLoader(widgetsFactory: wm.widgetsFactory);
        },
        errorBuilder: (_, __, ___) {
          return const PizzasError();
        },
        builder: (_, data) {
          return PizzasBuilder(
            data: data ?? [],
            refreshPlaces: wm.refreshPizzas,
          );
        },
      ),
    );
  }
}
