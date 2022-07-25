import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza_base.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza_size.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/sauce_type.dart';

/// CODE REVIEW
///
/// По моему мнению, это самая слабая часть статьи. Здесь билдер существует как
/// будто только для того, чтобы добавить его в статью. При этом абсолютно нет
/// примеров, чем этот паттерн может помочь в разработке. Свой пример реазиации
/// оставил в файле builder.dart

/// Пицца, которую собирает пользователь
/// [title] - название базовой пиццы c бэка
/// [ingredients] - дополнительные ингредиенты что пользователь добавляет к базовой пицце
class CustomPizza {
  /// CODE REVIEW
  ///
  /// Кажется, у тебя возникла проблема с использованием паттерна именно из-за
  /// недостаточной декомпозиции.
  ///
  /// Такое ощущение, что все поля этой модели просто используются в разных
  /// местах.
  ///
  /// Я предлагаю разделить это на 2 модели: PizzaData и PizzaProduct.
  /// В PizzaData буду храниться данные о пицце как наборе данных: название,
  /// изображение, цена. При этом составная часть пиццы должна быть отдельным
  /// параметром в модели. В PizzaProduct буду храниться ингредиенты, размер,
  /// соус и всё остальное. Такое ощущение, что именно для PizzaProduct нужен
  /// билдер, а для всего остального - нет.
  late final String title;
  late final PizzaBase base;
  late final SauceType sauce;
  late final Set<IngredientsType> ingredients;
  late final int price;
  late final String? imageUrl;

  static PizzaBuilder get builder => PizzaBuilder();

  /// CODE REVIEW
  ///
  /// Модель не должна быть зависима от способа создания.
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
}

class PizzaBuilder {
  String get title => _title;

  PizzaBase get base => _base;

  SauceType get sauce => _sauce;

  Set<IngredientsType> get ingredients => _ingredients;

  int get price => _price;

  String get imageUrl => _imageUrl;

  /// CODE REVIEW
  /// 
  /// Очень не нравится подход с использованием дефолтных значений вместо null.
  /// 
  /// Тут есть простая лакмусовая бумажка. Задай себе вопрос. Хочешь ли ты 
  /// увидеть дефолтные значения в приложении, которым ты пользуешься? И
  /// почему ты можешь увидеть именно те значения, которые стоят в дефолтных? 
  String _title = '';
  PizzaBase _base = const PizzaBase(size: PizzaSize.M);
  SauceType _sauce = SauceType.tomato;
  Set<IngredientsType> _ingredients = {};
  int _price = 0;
  String _imageUrl = '';

  // ignore: use_setters_to_change_properties
  void setTitle(String title) => _title = title;

  // ignore: use_setters_to_change_properties
  void setBase(PizzaBase base) => _base = base;

  // ignore: use_setters_to_change_properties
  void setSauce(SauceType sauce) => _sauce = sauce;

  // ignore: use_setters_to_change_properties
  void setIngredients(Set<IngredientsType> ingredients) =>
      _ingredients = ingredients;

  // ignore: use_setters_to_change_properties
  void setPrice(int price) => _price = price;

  // ignore: use_setters_to_change_properties
  void setImageUrl(String imageUrl) => _imageUrl = imageUrl;

  // ignore: use_to_and_as_if_applicable
  CustomPizza build() => CustomPizza(this);
}
