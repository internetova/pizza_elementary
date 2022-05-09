import 'package:pizza_elementary/features/pizza/api/dto/pizza_response_dto.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';

/// Маппер [Pizza] из [PizzaResponseDTO]
Pizza mapPizza(PizzaResponseDTO data) {
  return Pizza(
    id: data.id,
    title: data.title,
    ingredients: data.ingredients,
    price: data.price,
    imageUrl: data.imageUrl,
    description: data.description,
  );
}

/// Маппер для списка пиц
List<Pizza> mapListPizzas(List<PizzaResponseDTO> data) =>
    data.map(mapPizza).toList();
