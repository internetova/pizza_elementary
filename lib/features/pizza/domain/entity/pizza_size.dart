import 'package:pizza_elementary/features/pizza/constants/pizza_strings.dart';

enum PizzaSize {
  S(name: PizzaStrings.sizeS, size: 25, priceFactor: 0.8),
  M(name: PizzaStrings.sizeM, size: 30, priceFactor: 1.0),
  L(name: PizzaStrings.sizeL, size: 35, priceFactor: 1.2);

  final String name;
  final int size;
  final double priceFactor;

  const PizzaSize({
    required this.name,
    required this.size,
    required this.priceFactor,
  });

  String get sizeString => '$name - $size см';

  @override
  String toString() {
    return '$name - $size см';
  }
}
