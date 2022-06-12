import 'package:pizza_elementary/features/pizza/domain/entity/pizza_size.dart';

/// Основа для пиццы
class PizzaBase {
  final PizzaSize size;

  const PizzaBase({required this.size});

  @override
  String toString() {
    return 'Размер: ${size.name}} \n';
  }
}
