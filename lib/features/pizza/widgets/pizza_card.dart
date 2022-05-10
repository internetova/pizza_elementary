import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/common/constants/app_sizes.dart';
import 'package:pizza_elementary/features/common/widgets/buttons/text_button_with_icon.dart';
import 'package:pizza_elementary/features/pizza/constants/pizza_strings.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';
import 'package:pizza_elementary/util/money_formatter.dart';

class PizzaCard extends StatelessWidget {
  final Pizza pizza;

  const PizzaCard({Key? key, required this.pizza}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Material(
        borderRadius: BorderRadius.circular(AppSizes.radiusCard),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).cardColor,
        child: Row(
          children: [
            Expanded(
              child: SizedBox.expand(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(pizza.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _PizzaCardContent(pizza: pizza),
            ),
          ],
        ),
      ),
    );
  }
}

class _PizzaCardContent extends StatelessWidget {
  final Pizza pizza;

  const _PizzaCardContent({Key? key, required this.pizza}) : super(key: key);

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
            pizza.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              moneyFormatter.format(pizza.price),
              style: theme.textTheme.headline6?.copyWith(color: theme.errorColor),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButtonWithIcon(
              icon: EvaIcons.shoppingCartOutline,
              label: PizzaStrings.buttonTitleAddCart,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
