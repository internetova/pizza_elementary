import 'package:flutter/material.dart';
import 'package:pizza_elementary/assets/colors/colors.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color? green;
  final Color? green2;
  final Color? yellow;
  final Color? yellow2;

  CustomColors({
    this.green,
    this.green2,
    this.yellow,
    this.yellow2,
  });

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? green,
    Color? green2,
    Color? yellow,
    Color? yellow2,
  }) {
    return CustomColors(
      green: green ?? this.green,
      green2: green2 ?? this.green2,
      yellow: yellow ?? this.yellow,
      yellow2: yellow2 ?? this.yellow2,
    );
  }

  /// Управляет изменением свойств при изменении темы
  @override
  ThemeExtension<CustomColors> lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      green: Color.lerp(green, other.green, t),
      green2: Color.lerp(green2, other.green2, t),
      yellow: Color.lerp(yellow, other.yellow, t),
      yellow2: Color.lerp(yellow2, other.yellow2, t),
    );
  }

  static CustomColors light = CustomColors(
    green: AppColors.colorWhiteGreen,
    green2: AppColors.colorWhiteGreen2,
    yellow: AppColors.colorWhiteYellow,
    yellow2: AppColors.colorWhiteYellow2,
  );

  static CustomColors dark = CustomColors(
    green: AppColors.colorBlackGreen,
    green2: AppColors.colorBlackGreen2,
    yellow: AppColors.colorBlackYellow,
    yellow2: AppColors.colorBlackYellow2,
  );
}
