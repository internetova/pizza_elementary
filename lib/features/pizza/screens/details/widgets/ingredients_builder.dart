import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredient.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';
import 'package:pizza_elementary/features/pizza/widgets/ingredient_card.dart';
import 'package:pizza_elementary/util/typedefs.dart';

class IngredientsBuilder extends StatelessWidget {
  final List<Ingredient> data;
  final Set<IngredientsType> additionalData;
  final DuoValueChanged<IngredientsType, int> toggleIngredient;

  const IngredientsBuilder({
    Key? key,
    required this.data,
    required this.additionalData,
    required this.toggleIngredient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final widthItem = (width - 32) / 3;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: data.map((ingredient) {
        return IngredientCard(
          ingredient: ingredient,
          width: widthItem,
          isSelected: additionalData.contains(ingredient.type),
          toggleIngredient: toggleIngredient,
        );
      }).toList(),
    );
  }
}
