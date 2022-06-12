import 'package:pizza_elementary/features/pizza/api/data/ingredients_response.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredient.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';

/// Маппер [Ingredient] из [IngredientsResponse]
Ingredient mapPizzaIngredient(IngredientsResponse data) {
  return Ingredient(
    type: mapIngredientsTypeFromString(data.name),
    price: data.price,
    imageUrl: data.imageUrl,
  );
}

IngredientsType mapIngredientsTypeFromString(String data) {
  switch (data) {
    case 'бекон':
      return IngredientsType.bacon;
    case 'пикантная пепперони':
      return IngredientsType.pepperoni;
    case 'ветчина':
      return IngredientsType.ham;
    case 'свежие томаты':
      return IngredientsType.tomatoes;
    case 'шампиньоны':
      return IngredientsType.champignons;
    case 'маринованные огурчики':
      return IngredientsType.pickledCucumbers;
    case 'сладкий перец':
      return IngredientsType.sweetPepper;
    case 'красный лук':
      return IngredientsType.redOnion;
    case 'чеснок':
      return IngredientsType.garlic;
    case 'острый перец халапеньо':
      return IngredientsType.jalapeno;
    case 'сочный ананас':
      return IngredientsType.pineapple;
    case 'итальянские травы':
      return IngredientsType.italianHerbs;
    case 'сыры чеддер и пармезан':
      return IngredientsType.cheddarAndParmesan;
    case 'моцарелла':
      return IngredientsType.mozzarella;
    case 'кубики брынзы':
      return IngredientsType.cheeseCubes;
    case 'маслины':
      return IngredientsType.olives;
    case 'нежный цыпленок':
      return IngredientsType.chicken;
    default:
      return IngredientsType.unknown;
  }
}

/// Маппер для списка ингредиентов
List<Ingredient> mapListPizzaIngredients(List<IngredientsResponse> data) {
  return data.map(mapPizzaIngredient).toList();
}
