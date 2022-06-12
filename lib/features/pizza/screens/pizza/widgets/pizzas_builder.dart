import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';
import 'package:pizza_elementary/features/pizza/widgets/pizza_card.dart';
import 'package:pizza_elementary/util/typedefs.dart';

class PizzasBuilder extends StatelessWidget {
  final List<Pizza> data;
  final FutureVoidCallback refreshPlaces;
  final ValueChanged<Pizza> goPizzaDetails;
  final DataValueChanged<List<IngredientsType>, String> getIngredients;

  const PizzasBuilder({
    Key? key,
    required this.data,
    required this.refreshPlaces,
    required this.goPizzaDetails,
    required this.getIngredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshPlaces,
      child: ListView.builder(
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(8),
          child: PizzaCard(
            pizza: data[index],
            goPizzaDetails: goPizzaDetails,
            getIngredients: getIngredients,
          ),
        ),
        itemCount: data.length,
      ),
    );
  }
}
