import 'package:pizza_elementary/features/pizza/api/data/ingredients_response.dart';
import 'package:pizza_elementary/features/pizza/api/data/pizza_response.dart';

// ignore: one_member_abstracts
abstract class PizzaApi {
  /// Получить список пицц
  Future<List<PizzaResponse>> getAllPizzas();

  /// Получить список ингредиентов
  Future<List<IngredientsResponse>> getPizzaIngredients();
}
