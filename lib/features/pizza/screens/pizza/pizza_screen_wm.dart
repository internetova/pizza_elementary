import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/app/di/app_scope.dart';
import 'package:pizza_elementary/features/pizza/constants/pizza_strings.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';
import 'package:pizza_elementary/features/pizza/screens/pizza/pizza_screen.dart';
import 'package:pizza_elementary/features/pizza/screens/pizza/pizza_screen_model.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';
import 'package:provider/provider.dart';

abstract class IPizzaScreenWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<Pizza>>> get pizzaState;

  PlatformWidgetsFactory get widgetsFactory;

  PreferredSizeWidget get appBar;

  Future<void> refreshPizzas();
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

  @override
  PreferredSizeWidget get appBar => widgetsFactory.createAppBar(title: PizzaStrings.appBarTitle);

  PizzaScreenWidgetModel(PizzaScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _init();
  }

  /// Повторный запрос данных
  @override
  Future<void> refreshPizzas() async => _init();

  Future<void> _init() async {
    _pizzaState.loading();
    final pizzas = await model.getAllPizzas();
    _pizzaState.content(pizzas);
  }
}
