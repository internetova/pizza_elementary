import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/app/di/app_scope.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';
import 'package:pizza_elementary/features/pizza/screens/details/pizza_details_screen.dart';
import 'package:pizza_elementary/features/pizza/screens/pizza/pizza_screen.dart';
import 'package:pizza_elementary/features/pizza/screens/pizza/pizza_screen_model.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';
import 'package:pizza_elementary/util/extensions.dart';
import 'package:provider/provider.dart';

abstract class IPizzaScreenWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<Pizza>>> get pizzaState;

  PlatformWidgetsFactory get widgetsFactory;

  Future<void> refreshPizzas();

  void goPizzaDetails(Pizza pizza);

  String getIngredients(List<IngredientsType> ingredients);
}

PizzaScreenWidgetModel defaultPizzaScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();

  final model = PizzaScreenModel(
    appDependencies.errorHandler,
    appDependencies.pizzaService,
    appDependencies.widgetsFactory,
  );

  return PizzaScreenWidgetModel(model);
}

/// Default widget model for PizzaScreenWidget
class PizzaScreenWidgetModel extends WidgetModel<PizzaScreen, PizzaScreenModel>
    implements IPizzaScreenWidgetModel {
  final _pizzaState = EntityStateNotifier<List<Pizza>>();

  @override
  ListenableState<EntityState<List<Pizza>>> get pizzaState => _pizzaState;

  @override
  PlatformWidgetsFactory get widgetsFactory => model.widgetsFactory;

  PizzaScreenWidgetModel(PizzaScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _init();
  }

  /// Повторный запрос данных
  @override
  Future<void> refreshPizzas() async => _init();

  /// Перейти на детальный экран
  @override
  void goPizzaDetails(Pizza pizza) {
    widgetsFactory.openModalBottomSheet(
      context: context,
      builder: (context) => PizzaDetailsScreen(pizza: pizza),
    );
  }

  /// Получить список ингредиентов пиццы в виде форматированной строки
  @override
  String getIngredients(List<IngredientsType> ingredients) {
    final buffer = StringBuffer();

    for (var i = 0; i < ingredients.length; i++) {
      var str = '';

      if (i == 0) {
        str = '${ingredients[i].name.capitalize()}, ';
      } else if (i == ingredients.length - 1) {
        str = ingredients[i].name;
      } else {
        str = '${ingredients[i].name}, ';
      }

      buffer.write(str);
    }

    return buffer.toString();
  }

  Future<void> _init() async {
    _pizzaState.loading();
    final pizzas = await model.getAllPizzas();
    _pizzaState.content(pizzas);
  }
}
