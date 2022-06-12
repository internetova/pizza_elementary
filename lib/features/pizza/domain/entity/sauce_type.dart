enum SauceType {
  tomato(name: 'томатный соус', price: 100),
  barbecue(name: 'соус барбекю', price: 100),
  pesto(name: 'соус песто', price: 150);

  final String name;
  final int price;

  const SauceType({
    required this.name,
    required this.price,
  });
}
