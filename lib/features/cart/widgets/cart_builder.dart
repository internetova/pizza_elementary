import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pizza_elementary/features/cart/constants/cart_strings.dart';
import 'package:pizza_elementary/features/cart/widgets/cart_item.dart';
import 'package:pizza_elementary/features/common/constants/app_sizes.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/custom_pizza.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';
import 'package:pizza_elementary/util/money_formatter.dart';
import 'package:pizza_elementary/util/typedefs.dart';

class CartBuilder extends StatelessWidget {
  final ObservableList<CustomPizza> data;
  final int quantityInCart;
  final int totalCost;
  final DataValueChanged<Set<IngredientsType>, String> getIngredients;
  final ValueChanged<CustomPizza> removePizza;
  final VoidCallback clear;

  const CartBuilder({
    Key? key,
    required this.data,
    required this.quantityInCart,
    required this.totalCost,
    required this.getIngredients,
    required this.removePizza,
    required this.clear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppSizes.sizedBoxH16,
            Text(
              '$quantityInCart ${CartStrings.quantityPlural(quantityInCart)} ${CartStrings.forAmountOf} ${moneyFormatter.format(totalCost)}',
              style: Theme.of(context).textTheme.headline5,
            ),
            AppSizes.sizedBoxH16,
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: CartItem(
                    pizza: data[index],
                    getIngredients: getIngredients,
                    removePizza: removePizza,
                  ),
                ),
                itemCount: data.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
