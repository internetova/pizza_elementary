import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/pizza/constants/pizza_strings.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';
import 'package:pizza_elementary/features/pizza/screens/pizza/pizza_screen_wm.dart';
import 'package:pizza_elementary/features/pizza/screens/pizza/widgets/pizzas_builder.dart';
import 'package:pizza_elementary/features/pizza/screens/pizza/widgets/pizzas_error.dart';
import 'package:pizza_elementary/features/pizza/screens/pizza/widgets/pizzas_loader.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';

/// Main widget for PizzaScreen module
class PizzaScreen extends ElementaryWidget<IPizzaScreenWidgetModel> {
  const PizzaScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultPizzaScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPizzaScreenWidgetModel wm) {
    return Scaffold(
      appBar: _AppBar(widgetsFactory: wm.widgetsFactory),
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
            goPizzaDetails: wm.goPizzaDetails,
            getIngredients: wm.getIngredients,
          );
        },
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  final PlatformWidgetsFactory widgetsFactory;

  @override
  Size get preferredSize => Size.fromHeight(
        defaultTargetPlatform == TargetPlatform.iOS
            ? kMinInteractiveDimensionCupertino
            : kToolbarHeight,
      );

  const _AppBar({
    Key? key,
    required this.widgetsFactory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return widgetsFactory.createAppBar(
      title: PizzaStrings.appBarTitle,
    );
  }
}
