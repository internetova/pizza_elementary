import 'package:intl/intl.dart';

class CartStrings {
  static const appBarTitle = 'Ваша корзина';
  static const buttonOrderTitle = 'Заказать';
  static const forAmountOf = 'на сумму';
  static const plus = '+';
  static const empty = 'Корзина пуста';
  static const alertTitle = 'Проверьте ваш заказ:';
  static const alertTitleLeftButton = 'Изменить';
  static const alertTitleRightButton = 'Отправить';

  CartStrings._();

  static String quantityPlural(int quantity) => Intl.plural(
        quantity,
        zero: 'товаров',
        one: 'товар',
        two: 'товара',
        few: 'товара',
        other: 'товаров',
        many: 'товаров',
        name: 'CartStrings_quantityPlural',
        locale: 'Ru',
      );
}
