import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';

class Ingredient {
  final IngredientsType type;
  final int price;
  final String imageUrl;

  Ingredient({
    required this.type,
    required this.price,
    required this.imageUrl,
  });
}
