import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';
import 'package:pizza_elementary/features/pizza/widgets/pizza_card.dart';

typedef FutureVoidCallback = Future<void> Function();

class PizzasBuilder extends StatelessWidget {
  final List<Pizza> data;
  final FutureVoidCallback refreshPlaces;

  const PizzasBuilder({
    Key? key,
    required this.data,
    required this.refreshPlaces,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshPlaces,
      child: ListView.builder(
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(24),
          child: PizzaCard(pizza: data[index]),
        ),
        itemCount: data.length,
      ),
    );
  }
}
