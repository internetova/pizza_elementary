import 'package:flutter/material.dart';
import 'package:pizza_elementary/assets/themes/custom_colors.dart';
import 'package:pizza_elementary/features/common/constants/app_sizes.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredient.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';
import 'package:pizza_elementary/util/money_formatter.dart';
import 'package:pizza_elementary/util/typedefs.dart';

class IngredientCard extends StatelessWidget {
  final Ingredient ingredient;
  final double width;
  final DuoValueChanged<IngredientsType, int> toggleIngredient;
  final bool isSelected;

  const IngredientCard({
    Key? key,
    required this.ingredient,
    required this.width,
    required this.toggleIngredient,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(AppSizes.radiusCard);

    return Ink(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: kElevationToShadow[2],
        color: isSelected ? theme.extension<CustomColors>()!.yellow2 : theme.cardColor,
      ),
      child: InkWell(
        onTap: () => toggleIngredient(ingredient.type, ingredient.price),
        borderRadius: borderRadius,
        child: Container(
          width: width,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Image(
                image: AssetImage(ingredient.imageUrl),
                width: 60,
              ),
              AppSizes.sizedBoxH8,
              SizedBox(
                height: 40,
                child: Align(
                  child: Text(
                    ingredient.type.name,
                    style: theme.textTheme.caption,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              AppSizes.sizedBoxH8,
              Text(
                moneyFormatter.format(ingredient.price),
                style: theme.textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
