import 'package:pizza_elementary/features/pizza/api/services/pizza_api.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';
import 'package:pizza_elementary/features/pizza/domain/mappers/pizza_mapper.dart';

class PizzaRepository {
  final PizzaApi _pizzaApi;

  PizzaRepository(this._pizzaApi);

  Future<List<Pizza>> getAllPizzas() => _pizzaApi.getAllPizzas().then(mapListPizzas);
}
