import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pizza_elementary/features/pizza/api/dto/pizza_response_dto.dart';
import 'package:pizza_elementary/features/pizza/api/pizza_api_urls.dart';
import 'package:pizza_elementary/features/pizza/api/services/pizza_api.dart';

class PizzaApiMock with LoadAssetMock implements PizzaApi {
  @override
  Future<List<PizzaResponseDTO>> getAllPizzas() async {
    final pizzas = <PizzaResponseDTO>[];

    await addDelay(300);
    final jsonString = await loadAsset(PizzaApiUrls.allPizzas);
    final data = jsonDecode(jsonString) as Map<String, dynamic>;

    final pizzasData = data['pizzas'] as List;

    if (pizzasData.isNotEmpty) {
      for (final e in pizzasData) {
        pizzas.add(PizzaResponseDTO.fromJson(e as Map<String, dynamic>));
      }
    }

    return pizzas;
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
