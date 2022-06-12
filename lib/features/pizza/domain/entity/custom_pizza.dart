import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza_base.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza_size.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/sauce_type.dart';

/// Пицца, которую собирает пользователь
/// [title] - название базовой пиццы c бэка
/// [ingredients] - дополнительные ингредиенты что пользователь добавляет к базовой пицце
class CustomPizza {
  late final String title;
  late final PizzaBase base;
  late final SauceType sauce;
  late final Set<IngredientsType> ingredients;
  late final int price;
  late final String? imageUrl;

  CustomPizza(PizzaBuilder builder) {
    title = builder.title;
    base = builder.base;
    sauce = builder.sauce;
    ingredients = builder.ingredients;
    price = builder.price;
    imageUrl = builder.imageUrl;
  }

  @override
  String toString() {
    var info = 'Базовая пицца: $title\n';
    info += 'база: размер - ${base.size.name} ${base.size.size} см\n';
    info += 'соус: ${sauce.name}\n';

    final buffer = StringBuffer();
    for (final element in ingredients) {
      var str = '';
      str += '${element.name}, ';
      buffer.write(str);
    }

    info += 'ингредиенты: ${buffer.toString()}\n';
    buffer.clear();

    info += 'Цена: $price руб.\n';

    return info;
  }

  static PizzaBuilder get builder => PizzaBuilder();
}

class PizzaBuilder {
  String title_ = '';
  PizzaBase _base = const PizzaBase(size: PizzaSize.M);
  SauceType _sauce = SauceType.tomato;
  Set<IngredientsType> _ingredients = {};
  int _price = 0;
  String _imageUrl = '';

  String get title => title_;

  PizzaBase get base => _base;

  SauceType get sauce => _sauce;

  Set<IngredientsType> get ingredients => _ingredients;

  int get price => _price;

  String get imageUrl => _imageUrl;

  // ignore: use_setters_to_change_properties
  void setTitle(String title) => title_ = title;

  // ignore: use_setters_to_change_properties
  void setBase(PizzaBase base) => _base = base;

  // ignore: use_setters_to_change_properties
  void setSauce(SauceType sauce) => _sauce = sauce;

  // ignore: use_setters_to_change_properties
  void setIngredients(Set<IngredientsType> ingredients) => _ingredients = ingredients;

  // ignore: use_setters_to_change_properties
  void setPrice(int price) => _price = price;

  // ignore: use_setters_to_change_properties
  void setImageUrl(String imageUrl) => _imageUrl = imageUrl;

  // ignore: use_to_and_as_if_applicable
  CustomPizza build() => CustomPizza(this);
}
