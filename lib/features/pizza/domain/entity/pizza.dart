import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza_base.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/sauce_type.dart';

/// Пицца с бэка
class Pizza {
  final int id;
  final String title;
  final PizzaBase base;
  final SauceType sauce;
  final List<IngredientsType> ingredients;
  final int price;
  final String imageUrl;

  Pizza({
    required this.id,
    required this.title,
    required this.base,
    required this.sauce,
    required this.ingredients,
    required this.price,
    required this.imageUrl,
  });
}
