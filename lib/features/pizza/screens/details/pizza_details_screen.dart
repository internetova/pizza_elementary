import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pizza_elementary/features/common/constants/app_sizes.dart';
import 'package:pizza_elementary/features/common/widgets/buttons/button_rounded.dart';
import 'package:pizza_elementary/features/pizza/constants/pizza_strings.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredient.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/ingredients_type.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/pizza.dart';
import 'package:pizza_elementary/features/pizza/screens/details/pizza_details_screen_wm.dart';
import 'package:pizza_elementary/features/pizza/screens/details/widgets/ingredients_builder.dart';
import 'package:pizza_elementary/features/pizza/screens/details/widgets/ingredients_error.dart';
import 'package:pizza_elementary/features/pizza/screens/details/widgets/ingredients_loader.dart';
import 'package:surf_util/surf_util.dart';

/// Main widget for PizzaDetailsScreen module
class PizzaDetailsScreen extends ElementaryWidget<IPizzaDetailsScreenWidgetModel> {
  final Pizza pizza;

  const PizzaDetailsScreen({
    required this.pizza,
    Key? key,
    WidgetModelFactory wmFactory = defaultPizzaDetailsScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPizzaDetailsScreenWidgetModel wm) {
    return Scaffold(
      backgroundColor: wm.theme.cardColor,
      body: DisableOverscroll(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _BuildPizzaDescription(
                    pizza: pizza,
                    getIngredients: wm.getIngredients,
                  ),
                  EntityStateNotifierBuilder<List<Ingredient>>(
                    listenableEntityState: wm.ingredientsState,
                    loadingBuilder: (_, __) {
                      return IngredientsLoader(widgetsFactory: wm.widgetsFactory);
                    },
                    errorBuilder: (_, __, ___) {
                      return const IngredientsError();
                    },
                    builder: (_, data) {
                      return StateNotifierBuilder<Set<IngredientsType>>(
                        listenableState: wm.additionalIngredientsState,
                        builder: (_, additionalData) => IngredientsBuilder(
                          data: data!,
                          additionalData: additionalData!,
                          toggleIngredient: wm.toggleIngredient,
                        ),
                      );
                    },
                  ),
                  wm.sizedBox,
                ],
              ),
            ),
            Positioned(
              top: 26,
              right: 16,
              child: ButtonRounded(
                backgroundColor: wm.theme.cardColor,
                radius: 50,
                size: 40,
                iconData: Ionicons.close,
                elevation: 2,
                onPressed: wm.close,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: wm.bottomSheet,
    );
  }
}

/// Описание базовой пиццы
class _BuildPizzaDescription extends StatelessWidget {
  final Pizza pizza;
  final ValueGetter<String> getIngredients;

  const _BuildPizzaDescription({
    Key? key,
    required this.pizza,
    required this.getIngredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSizes.sizedBoxH12,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Image(
              image: AssetImage(pizza.imageUrl),
            ),
          ),
          AppSizes.sizedBoxH12,
          Text(pizza.title, style: theme.textTheme.headline4),
          AppSizes.sizedBoxH12,
          Text('${pizza.base.size.name} - ${pizza.base.size.size} см'),
          AppSizes.sizedBoxH12,
          EasyRichText(
            PizzaStrings.ingredients + getIngredients(),
            patternList: [
              EasyRichTextPattern(
                targetString: PizzaStrings.ingredients,
                style: theme.textTheme.subtitle1,
              ),
            ],
          ),
          AppSizes.sizedBoxH12,
          Text(PizzaStrings.addIngredients, style: theme.textTheme.headline5),
        ],
      ),
    );
  }
}
