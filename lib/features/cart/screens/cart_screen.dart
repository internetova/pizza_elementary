import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobx/mobx.dart';
import 'package:pizza_elementary/features/cart/constants/cart_strings.dart';
import 'package:pizza_elementary/features/cart/screens/cart_screen_wm.dart';
import 'package:pizza_elementary/features/cart/widgets/cart_item.dart';
import 'package:pizza_elementary/features/common/constants/app_sizes.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/custom_pizza.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';
import 'package:pizza_elementary/util/money_formatter.dart';

/// Экран корзина
class CartScreen extends ElementaryWidget<ICartScreenWidgetModel> {
  const CartScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultCartScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICartScreenWidgetModel wm) {
    return Scaffold(
      appBar: _AppBar(
        widgetsFactory: wm.widgetsFactory,
        cartList: wm.cartList,
        clear: wm.clear,
      ),
      body: Observer(
        builder: (_) {
          return wm.cartList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      AppSizes.sizedBoxH16,
                      Text(
                        '${wm.quantityInCart} ${CartStrings.quantityPlural(
                          wm.quantityInCart,
                        )} ${CartStrings.forAmountOf} ${moneyFormatter.format(
                          wm.totalCost,
                        )}',
                        style: wm.theme.textTheme.headline5,
                      ),
                      AppSizes.sizedBoxH16,
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (_, index) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: CartItem(
                              pizza: wm.cartList[index],
                              getIngredients: wm.getIngredients,
                              removePizza: wm.removePizza,
                            ),
                          ),
                          itemCount: wm.cartList.length,
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: Text(CartStrings.empty),
                );
        },
      ),
      floatingActionButton: _OrderButton(
        title: CartStrings.buttonOrderTitle.toUpperCase(),
        widgetsFactory: wm.widgetsFactory,
        cartList: wm.cartList,
        makeOrder: wm.makeOrder,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  final PlatformWidgetsFactory widgetsFactory;
  final ObservableList<CustomPizza> cartList;
  final VoidCallback clear;

  @override
  Size get preferredSize => Size.fromHeight(
        defaultTargetPlatform == TargetPlatform.iOS
            ? kMinInteractiveDimensionCupertino
            : kToolbarHeight,
      );

  const _AppBar({
    Key? key,
    required this.widgetsFactory,
    required this.cartList,
    required this.clear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return widgetsFactory.createAppBar(
      title: CartStrings.appBarTitle,
      actionButton: Observer(
        builder: (_) {
          return cartList.isNotEmpty
              ? IconButton(
                  color: theme.errorColor,
                  onPressed: clear,
                  icon: const Icon(Ionicons.trash_outline),
                  splashRadius: 20,
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}

class _OrderButton extends StatelessWidget {
  final PlatformWidgetsFactory widgetsFactory;
  final ObservableList<CustomPizza> cartList;
  final VoidCallback makeOrder;
  final String title;

  const _OrderButton({
    Key? key,
    required this.widgetsFactory,
    required this.cartList,
    required this.makeOrder,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return cartList.isNotEmpty
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: widgetsFactory.createButton(
                  onPressed: makeOrder,
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
