import 'package:pizza_elementary/features/pizza/api/dto/pizza_response_dto.dart';

// ignore: one_member_abstracts
abstract class PizzaApi {
  /// Получить список пицц
  Future<List<PizzaResponseDTO>> getAllPizzas();
}