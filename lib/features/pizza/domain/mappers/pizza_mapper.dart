import 'package:pizza_elementary/features/pizza/api/data/pizza_response.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza_base.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza_size.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/sauce_type.dart';

/// Маппер [Pizza] из [PizzaResponse]
Pizza mapPizza(PizzaResponse data) {
  return Pizza(
    id: data.id,
    title: data.title,
    base: mapPizzaBase(data.base),
    sauce: mapPizzaSauceFromString(data.sauce),
    ingredients: data.ingredients.map(mapPizzaIngredientsFromString).toList(),
    price: data.price,
    imageUrl: data.imageUrl,
  );
}

PizzaBase mapPizzaBase(PizzaBaseResponse data) {
  return PizzaBase(size: mapPizzaSizeFromString(data.size));
}

PizzaSize mapPizzaSizeFromString(String data) {
  switch (data) {
    case 'S':
      return PizzaSize.S;
    case 'M':
      return PizzaSize.M;
    case 'L':
      return PizzaSize.L;
    default:
      return PizzaSize.M;
  }
}

SauceType mapPizzaSauceFromString(String data) {
  switch (data) {
    case 'томатный соус':
      return SauceType.tomato;
    case 'соус песто':
      return SauceType.pesto;
    case 'соус барбекю':
      return SauceType.barbecue;
    default:
      return SauceType.tomato;
  }
}

IngredientsType mapPizzaIngredientsFromString(String data) {
  switch (data) {
    case 'бекон':
      return IngredientsType.bacon;
    case 'шампиньоны':
      return IngredientsType.champignons;
    case 'сыры чеддер и пармезан':
      return IngredientsType.cheddarAndParmesan;
    case 'чеснок':
      return IngredientsType.garlic;
    case 'ветчина':
      return IngredientsType.ham;
    case 'итальянские травы':
      return IngredientsType.italianHerbs;
    case 'острый перец халапеньо':
      return IngredientsType.jalapeno;
    case 'пикантная пепперони':
      return IngredientsType.pepperoni;
    case 'маринованные огурчики':
      return IngredientsType.pickledCucumbers;
    case 'сочный ананас':
      return IngredientsType.pineapple;
    case 'красный лук':
      return IngredientsType.redOnion;
    case 'сладкий перец':
      return IngredientsType.sweetPepper;
    case 'томаты':
      return IngredientsType.tomatoes;
    case 'моцарелла':
      return IngredientsType.mozzarella;
    case 'кубики брынзы':
      return IngredientsType.cheeseCubes;
    default:
      return IngredientsType.unknown;
  }
}

/// Маппер для списка пиц
List<Pizza> mapListPizzas(List<PizzaResponse> data) => data.map(mapPizza).toList();
