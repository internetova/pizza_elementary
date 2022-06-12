import 'package:pizza_elementary/features/pizza/domain/entity/ingredient.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';
import 'package:pizza_elementary/features/pizza/domain/repository/pizza_repository.dart';

class PizzaService {
  final PizzaRepository _repository;

  PizzaService(this._repository);

  /// Получить список пицц
  Future<List<Pizza>> getAllPizzas() => _repository.getAllPizzas();

  Future<List<Ingredient>> getPizzaIngredients() => _repository.getPizzaIngredients();
}
