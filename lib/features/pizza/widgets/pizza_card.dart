import 'package:flutter/material.dart';
import 'package:pizza_elementary/assets/themes/themes.dart';
import 'package:pizza_elementary/features/common/constants/app_sizes.dart';
import 'package:pizza_elementary/features/pizza/constants/pizza_strings.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';
import 'package:pizza_elementary/util/money_formatter.dart';
import 'package:pizza_elementary/util/typedefs.dart';

class PizzaCard extends StatelessWidget {
  final Pizza pizza;
  final ValueChanged<Pizza> goPizzaDetails;
  final DataValueChanged<List<IngredientsType>, String> getIngredients;

  const PizzaCard({
    Key? key,
    required this.pizza,
    required this.goPizzaDetails,
    required this.getIngredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 1.8,
      child: Material(
        borderRadius: BorderRadius.circular(AppSizes.radiusCard),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).cardColor,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox.expand(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(pizza.imageUrl),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _PizzaCardContent(
                    pizza: pizza,
                    getIngredients: getIngredients,
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  onTap: () => goPizzaDetails(pizza),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PizzaCardContent extends StatelessWidget {
  final Pizza pizza;
  final DataValueChanged<List<IngredientsType>, String> getIngredients;

  const _PizzaCardContent({
    Key? key,
    required this.pizza,
    required this.getIngredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pizza.title,
            style: theme.textTheme.headline6,
          ),
          AppSizes.sizedBoxH12,
          Text(
            getIngredients(pizza.ingredients),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.caption,
          ),
          const Spacer(),
          DecoratedBox(
            decoration: BoxDecoration(
              color: theme.colorScheme.green,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            child: SizedBox(
              width: 120,
              height: 34,
              child: Align(
                child: Text(
                  PizzaStrings.from + moneyFormatter.format(pizza.price),
                  style: theme.textTheme.headline6?.copyWith(color: theme.cardColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
