import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/app/di/app_scope.dart';
import 'package:pizza_elementary/features/pizza/constants/pizza_strings.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/custom_pizza.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredient.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';
import 'package:pizza_elementary/features/pizza/screens/details/pizza_details_screen.dart';
import 'package:pizza_elementary/features/pizza/screens/details/pizza_details_screen_model.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';
import 'package:pizza_elementary/util/money_formatter.dart';
import 'package:provider/provider.dart';

abstract class IPizzaDetailsScreenWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<Ingredient>>> get ingredientsState;

  ListenableState<Set<IngredientsType>> get additionalIngredientsState;

  ThemeData get theme;

  PlatformWidgetsFactory get widgetsFactory;

  Widget get bottomSheet;

  Widget get orderButton;

  Widget get sizedBox;

  String getIngredients();

  void toggleIngredient(IngredientsType ingredientsType, int price);

  void close();
}

PizzaDetailsScreenWidgetModel defaultPizzaDetailsScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final navigator = Navigator.of(context);

  final model = PizzaDetailsScreenModel(
    appDependencies.errorHandler,
    appDependencies.pizzaService,
    appDependencies.widgetsFactory,
  );

  return PizzaDetailsScreenWidgetModel(model, navigator);
}

/// Default widget model for PizzaDetailsScreenWidget
class PizzaDetailsScreenWidgetModel extends WidgetModel<PizzaDetailsScreen, PizzaDetailsScreenModel>
    implements IPizzaDetailsScreenWidgetModel {
  /// Состояние списка ингредиентов
  final _ingredientsState = EntityStateNotifier<List<Ingredient>>();

  /// Состояние списка дополнительных ингредиентов
  final _additionalIngredientsState = StateNotifier<Set<IngredientsType>>(initValue: {});

  /// Цена на кнопке заказа
  late final StateNotifier<int> _finalPriceState;

  final NavigatorState _navigator;

  /// Карта для учета выбранных ингредиентов с ценой
  final _additionalIngredientsMap = <IngredientsType, int>{};

  /// Билдер для кастомной пиццы
  final _pizzaBuilder = CustomPizza.builder;

  @override
  ListenableState<EntityState<List<Ingredient>>> get ingredientsState => _ingredientsState;

  @override
  ListenableState<Set<IngredientsType>> get additionalIngredientsState =>
      _additionalIngredientsState;

  @override
  ThemeData get theme => Theme.of(context);

  @override
  PlatformWidgetsFactory get widgetsFactory => model.widgetsFactory;

  @override
  Widget get bottomSheet => widgetsFactory.createBottomSheet(
        child: orderButton,
      );

  @override
  Widget get orderButton => widgetsFactory.createButton(
        child: StateNotifierBuilder<int>(
          listenableState: _finalPriceState,
          builder: (_, price) {
            return Text(
              PizzaStrings.buttonTitleAddCart + moneyFormatter.format(price),
              style: const TextStyle(color: Colors.white),
            );
          },
        ),
        onPressed: () {
          final customPizza = _pizzaBuilder.build();
          debugPrint('--------customPizza \n$customPizza');
        },
      );

  @override
  Widget get sizedBox => widgetsFactory.createSizedBox();

  PizzaDetailsScreenWidgetModel(
    PizzaDetailsScreenModel model,
    NavigatorState navigator,
  )   : _navigator = navigator,
        super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _init();
  }

  /// Получить список ингредиентов пиццы в виде форматированной строки
  @override
  String getIngredients() {
    final ingredients = widget.pizza.ingredients;
    final buffer = StringBuffer();

    for (var i = 0; i < ingredients.length; i++) {
      var str = '';

      if (i == ingredients.length - 1) {
        str = '${ingredients[i].name}, ${widget.pizza.sauce.name}.';
      } else {
        str = '${ingredients[i].name}, ';
      }

      buffer.write(str);
    }

    return buffer.toString();
  }

  /// Выбор / отмена дополнительных ингредиентов
  @override
  void toggleIngredient(IngredientsType ingredient, int price) {
    /// Запишем в карту с ценой чтобы посчитать финальную цену для кнопки заказа
    _additionalIngredientsMap.containsKey(ingredient)
        ? _additionalIngredientsMap.remove(ingredient)
        : _additionalIngredientsMap[ingredient] = price;

    final items = _additionalIngredientsState.value?.toSet();
    items?.contains(ingredient) ?? false ? items?.remove(ingredient) : items?.add(ingredient);

    _additionalIngredientsState.accept(items);
    _calculateFinalPrice();

    _pizzaBuilder
      ..setIngredients(_additionalIngredientsState.value!)
      ..setPrice(_finalPriceState.value!);
  }

  /// Закрыть деталку с пиццей
  @override
  void close() {
    _navigator.pop();
  }

  /// Финальная цена для кнопки заказа
  void _calculateFinalPrice() {
    final basePrice = widget.pizza.price;
    final additionalPrice = _additionalIngredientsMap.values.reduce((a, b) => a + b);

    _finalPriceState.accept(basePrice + additionalPrice);
  }

  Future<void> _init() async {
    _finalPriceState = StateNotifier<int>(initValue: widget.pizza.price);
    _ingredientsState.loading();
    final pizzas = await model.getPizzaIngredients();
    _ingredientsState.content(pizzas);

    _pizzaBuilder
      ..setTitle(widget.pizza.title)
      ..setBase(widget.pizza.base)
      ..setSauce(widget.pizza.sauce)
      ..setImageUrl(widget.pizza.imageUrl);
  }
}
