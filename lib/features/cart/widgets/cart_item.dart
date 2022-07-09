import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pizza_elementary/features/cart/constants/cart_strings.dart';
import 'package:pizza_elementary/features/common/constants/app_sizes.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/custom_pizza.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';
import 'package:pizza_elementary/util/money_formatter.dart';
import 'package:pizza_elementary/util/typedefs.dart';

/// Позиция в корзине
class CartItem extends StatelessWidget {
  final CustomPizza pizza;
  final DataValueChanged<Set<IngredientsType>, String> getIngredients;
  final ValueChanged<CustomPizza> removePizza;

  const CartItem({
    Key? key,
    required this.pizza,
    required this.getIngredients,
    required this.removePizza,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusCard),
        color: Theme.of(context).cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: pizza.imageUrl != null
                      ? DecoratedBox(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(pizza.imageUrl!),
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
                AppSizes.sizedBoxW8,
                Expanded(
                  child: _CartItemContent(
                    pizza: pizza,
                    getIngredients: getIngredients,
                  ),
                ),
              ],
            ),
            const Divider(),
            _CartItemPrice(
              pizza: pizza,
              removePizza: removePizza,
            ),
          ],
        ),
      ),
    );
  }
}

class _CartItemContent extends StatelessWidget {
  final CustomPizza pizza;
  final DataValueChanged<Set<IngredientsType>, String> getIngredients;

  const _CartItemContent({
    Key? key,
    required this.pizza,
    required this.getIngredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ingredients = getIngredients(pizza.ingredients);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pizza.title,
          style: theme.textTheme.headline6,
        ),
        AppSizes.sizedBoxH12,
        if (ingredients.isNotEmpty)
          Text(
            '${CartStrings.plus} $ingredients',
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.caption,
          ),
      ],
    );
  }
}

class _CartItemPrice extends StatelessWidget {
  final CustomPizza pizza;
  final ValueChanged<CustomPizza> removePizza;

  const _CartItemPrice({
    Key? key,
    required this.pizza,
    required this.removePizza,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            moneyFormatter.format(pizza.price),
            style: theme.textTheme.headline5,
          ),
        ),
        IconButton(
          color: theme.errorColor,
          onPressed: () => removePizza(pizza),
          icon: const Icon(Ionicons.trash_outline),
          splashRadius: 20,
        ),
      ],
    );
  }
}
