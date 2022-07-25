import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza_base.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza_size.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/sauce_type.dart';

/// Первое.
///
/// Конкретная модель должна быть абсолютно независима от билдера.
/// Проектировать её нужно так, будто конкретного билдера вовсе не существует.
///
/// Билдер - всего-лишь инструмент. Конечная цель - получить из билдера
/// конкретную модель.
class PizzaProduct {
  final PizzaBase base;
  final SauceType sauce;
  final List<IngredientsType> ingredients;

  PizzaProduct(this.base, this.sauce, this.ingredients);
}

/// У Билдера есть 2 основных назначения:
///
/// 1. Отделить мутабельную часть модели от иммутабельной.
/// 2. Позволить изменять при этом составные части объекта в разных местах
///    в разный промежуток времени.
/// 3. Иметь возможность контроллировать процесс сборки составных частей
///    базового объекта.
///
/// Если пункт 1 можно рассматривать как сугубо утилитарный (в целом, для
/// его реализации можно использовать какой-нибудь переиспользуемный билдер),
/// то пункты 2 и 3 уже требуют тщательного подхода к реализации.
abstract class PizzaProductBuilder {
  PizzaBase? base;

  SauceType? sauce;

  bool _isBuilt = false;

  List<IngredientsType> get _ingredients;

  void addBacon();

  void addPepperoni();

  void addHam();

  PizzaProduct build() {
    assert(!_isBuilt, 'Пицца уже была приготовлена');

    if (base != null || sauce != null) {
      throw Exception('Пицца не может быть без базы и соуса');
    }

    _isBuilt = true;

    return PizzaProduct(
      base!,
      sauce!,
      _ingredients,
    );
  }
}

/// Билдер для данного случая у нас может ещё и выступать контроллером
/// ингредиентов, которые мы к нему добавляем.
class CustomPizzaProductBuilder extends PizzaProductBuilder {
  @override
  final List<IngredientsType> _ingredients = [];

  /// Предположим, что у нас здесь есть некие требования по количеству ингредиентов.
  ///
  /// Эти изменения в билдер можно даже добавлять извне.
  @override
  void addBacon() {
    final baconCount =
        _ingredients.where((i) => i == IngredientsType.bacon).length;

    if (baconCount > 3) {
      throw Exception('Бекона не может быть более 3 штук');
    }

    _ingredients.add(IngredientsType.bacon);
  }

  @override
  void addHam() {
    throw Exception('Нельзя добавлять говядину в пользовательскую пиццу');
  }

  @override
  void addPepperoni() {
    final pepperoniCount =
        _ingredients.where((i) => i == IngredientsType.pepperoni).length;

    if (pepperoniCount > 3) {
      throw Exception('Пепперони не может быть более 3 штук');
    }

    _ingredients.add(IngredientsType.pepperoni);
  }
}

class PepperoniPizzaProductBuilder extends PizzaProductBuilder {
  /// Можем сразу добавить дефолтный ингредиент.
  @override
  final List<IngredientsType> _ingredients = [IngredientsType.pepperoni];

  @override
  void addBacon() {
    throw Exception('Нельзя добавлять бекон в пепперони');
  }

  @override
  void addHam() {
    throw Exception('Нельзя добавлять говядину в пепперони');
  }

  @override
  void addPepperoni() {
    final pepperoniCount =
        _ingredients.where((i) => i == IngredientsType.pepperoni).length;

    if (pepperoniCount > 2) {
      throw Exception('В пепперони можнно сделать только двойную порцию');
    }

    _ingredients.add(IngredientsType.pepperoni);
  }
}

void example(PizzaProductBuilder builder) {
  /// Пример обработки действия пользователя, который поменял базу и соус.
  /// Как видишь, логику можно переиспользовать для билдера любой пиццы.
  void onUserChangeBaseAndSauce(PizzaBase base, SauceType sauce) {
    builder
      ..base = base
      ..sauce = sauce;
  }

  /// Тут мы тоже можем переиспользовать логику добавления бекона, не обращая
  /// внимание на конкретную реализацию метода для каждой возможно логики
  /// бекона.
  void onUserWantsToAddThreeBacons() {
    try {
      builder
        ..addBacon()
        ..addBacon()
        ..addBacon();
    } on Exception catch (e) {}
  }

  /// Обычный пример билда кастомной пиццы
  final pizzaProduct = (builder
        ..base = const PizzaBase(size: PizzaSize.M)
        ..sauce = SauceType.tomato
        ..addBacon()
        ..addPepperoni()
        ..addBacon()
        ..addHam())
      .build();
}
