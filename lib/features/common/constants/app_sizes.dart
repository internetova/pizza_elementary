import 'package:flutter/material.dart';

/// Часто используемые размеры, значения, маленькие виджеты
class AppSizes {
  /// размеры элементов
  static const double radiusCard = 12;

  /// частые отступы
  static const sizedBoxW4 = SizedBox(width: 4);
  static const sizedBoxW8 = SizedBox(width: 8);
  static const sizedBoxW12 = SizedBox(width: 12);
  static const sizedBoxW16 = SizedBox(width: 16);

  static const sizedBoxH4 = SizedBox(height: 4);
  static const sizedBoxH8 = SizedBox(height: 8);
  static const sizedBoxH12 = SizedBox(height: 12);
  static const sizedBoxH16 = SizedBox(height: 16);
  static const sizedBoxH24 = SizedBox(height: 24);

  /// отступ под боттомшит чтобы прокрутить контент под ним
  static const cupertinoIndentationUnderBottomSheet = 120.0;
  static const materialIndentationUnderBottomSheet = 100.0;

  AppSizes._();
}
