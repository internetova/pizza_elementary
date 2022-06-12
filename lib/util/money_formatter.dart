import 'package:intl/intl.dart';

final NumberFormat moneyFormatter =
    NumberFormat.currency(locale: 'ru', symbol: '₽', decimalDigits: 0);
