import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pizza_elementary/features/pizza/api/data/ingredients_response.dart';
import 'package:pizza_elementary/features/pizza/api/data/pizza_response.dart';
import 'package:pizza_elementary/features/pizza/api/pizza_api_urls.dart';
import 'package:pizza_elementary/features/pizza/api/services/pizza_api.dart';

class PizzaApiMock with LoadAssetMock implements PizzaApi {
  @override
  Future<List<PizzaResponse>> getAllPizzas() async {
    final pizzas = <PizzaResponse>[];

    await addDelay(500);
    final jsonString = await loadAsset(PizzaApiUrls.allPizzas);
    final data = jsonDecode(jsonString) as Map<String, dynamic>;

    final pizzasData = data['pizzas'] as List;

    if (pizzasData.isNotEmpty) {
      for (final e in pizzasData) {
        pizzas.add(PizzaResponse.fromJson(e as Map<String, dynamic>));
      }
    }

    return pizzas;
  }

  @override
  Future<List<IngredientsResponse>> getPizzaIngredients() async {
    final ingredients = <IngredientsResponse>[];

    await addDelay(300);
    final jsonString = await loadAsset(PizzaApiUrls.ingredients);
    final data = jsonDecode(jsonString) as Map<String, dynamic>;

    final ingredientsData = data['ingredients'] as List;

    if (ingredientsData.isNotEmpty) {
      for (final e in ingredientsData) {
        ingredients.add(IngredientsResponse.fromJson(e as Map<String, dynamic>));
      }
    }

    return ingredients;
  }
}

mixin LoadAssetMock {
  Future<String> loadAsset(String path) async {
    return rootBundle.loadString(path);
  }

  Future<void> addDelay(int ms) async {
    await Future<void>.delayed(Duration(milliseconds: ms));
  }
}
