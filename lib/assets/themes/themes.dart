import 'package:flutter/material.dart';
import 'package:pizza_elementary/assets/colors/colors.dart';
import 'package:pizza_elementary/assets/themes/text_style.dart';

class AppTheme {
  static ThemeData get lightTheme => _buildTheme();

  static ThemeData get darkTheme => _buildThemeDark();

  AppTheme._();

  /// Светлая тема
  // ignore: long-method
  static ThemeData _buildTheme() {
    final base = ThemeData.light();

    return base.copyWith(
      brightness: Brightness.light,
      primaryColor: AppColors.lightPrimaryColor,
      primaryColorLight: AppColors.lightPrimaryColorLight,
      primaryColorDark: AppColors.lightPrimaryColorLight,
      backgroundColor: AppColors.lightScaffoldBackgroundColor,
      scaffoldBackgroundColor: AppColors.lightScaffoldBackgroundColor,
      disabledColor: AppColors.lightPrimaryColorLight,
      primaryTextTheme: _buildPrimaryTextTheme(base.primaryTextTheme),
      textTheme: _buildTextTheme(base.textTheme),
      colorScheme: base.colorScheme.copyWith(
        background: AppColors.lightBackgroundColor,
        secondary: AppColors.lightSecondaryColor,
        onPrimary: AppColors.lightOnPrimaryColor,
        primary: AppColors.lightPrimaryColorDark,
      ),
      appBarTheme: base.appBarTheme.copyWith(
        color: AppColors.lightPrimaryColor,
        titleTextStyle:
            AppTypography.textSubtitle18Medium.copyWith(color: AppColors.lightPrimaryColorDark),
        elevation: 0,
      ),
      tabBarTheme: base.tabBarTheme.copyWith(
        indicator: BoxDecoration(
          color: AppColors.lightSecondaryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        labelStyle: AppTypography.textSmall14Bold,
        labelColor: AppColors.lightPrimaryColor,
        unselectedLabelColor: AppColors.lightBackgroundColor,
        unselectedLabelStyle: AppTypography.textSmall14Bold,
      ),
      bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColors.lightPrimaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.lightPrimaryColorDark,
        unselectedItemColor: AppColors.lightSecondaryColor,
      ),
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: AppColors.lightButtonColor,
        textTheme: ButtonTextTheme.primary,
        disabledColor: AppColors.lightPrimaryColorLight,
      ),
      iconTheme: base.iconTheme.copyWith(
        color: AppColors.lightIconColor,
        size: 24,
      ),
      sliderTheme: base.sliderTheme.copyWith(
        trackHeight: 2,
        thumbColor: AppColors.lightPrimaryColor,
        activeTrackColor: AppColors.lightAccentColor,
      ),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
        backgroundColor: AppColors.lightAccentColor,
        elevation: 0,
        highlightElevation: 0,
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        errorStyle: const TextStyle(fontSize: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.lightAccentColor.withOpacity(0.4),
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.colorInactiveBlack,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.lightErrorColor.withOpacity(0.4),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.lightErrorColor.withOpacity(0.4),
            width: 2,
          ),
        ),
      ),
      bottomSheetTheme: base.bottomSheetTheme.copyWith(
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headline6:
          AppTypography.textSubtitle18Medium.copyWith(color: AppColors.lightPrimaryColorDark),
      headline5: AppTypography.textText16Medium.copyWith(color: AppColors.lightSecondaryColor),
      headline4: AppTypography.textTitle24Bold.copyWith(color: AppColors.lightSecondaryColor),
      headline3:
          AppTypography.textLargeTitle32Bold.copyWith(color: AppColors.lightPrimaryColorDark),
      subtitle1: AppTypography.textSmall14Bold.copyWith(color: AppColors.lightSecondaryColor),
      subtitle2: AppTypography.textSmall14Bold.copyWith(color: AppColors.lightPrimaryColor),
      bodyText1: AppTypography.textSmall14Regular.copyWith(color: AppColors.lightSecondaryColor),
      bodyText2: AppTypography.textSmall14Regular.copyWith(color: AppColors.lightSecondaryVariant),
      caption: AppTypography.textSuperSmall12Regular.copyWith(color: AppColors.lightSecondaryColor),
      button: AppTypography.textButton,
    );
  }

  static TextTheme _buildPrimaryTextTheme(TextTheme base) {
    return base.copyWith(
      headline6: AppTypography.textSubtitle18Medium.copyWith(color: AppColors.lightBackgroundColor),
      subtitle1: AppTypography.textText16Regular.copyWith(color: AppColors.lightPrimaryColorDark),
      bodyText1: AppTypography.textSmall14Regular.copyWith(color: AppColors.lightAccentColor),
      bodyText2: AppTypography.textSmall14Regular.copyWith(color: AppColors.lightBackgroundColor),
      caption: AppTypography.textSuperSmall12Medium.copyWith(color: AppColors.colorWhite),
    );
  }

  /// Темная тема
  // ignore: long-method
  static ThemeData _buildThemeDark() {
    final base = ThemeData.dark();

    return base.copyWith(
      brightness: Brightness.dark,
      primaryColor: AppColors.darkPrimaryColor,
      primaryColorLight: AppColors.darkPrimaryColorDark,
      primaryColorDark: AppColors.darkPrimaryColorDark,
      backgroundColor: AppColors.darkScaffoldBackgroundColor,
      scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
      disabledColor: AppColors.darkPrimaryColorLight,
      primaryTextTheme: _buildPrimaryTextThemeDark(base.primaryTextTheme),
      textTheme: _buildTextThemeDark(base.textTheme),
      colorScheme: base.colorScheme.copyWith(
        background: AppColors.darkBackgroundColor,
        secondary: AppColors.darkSecondaryColor,
        onPrimary: AppColors.darkOnPrimaryColor,
        primary: AppColors.colorWhite,
      ),
      appBarTheme: base.appBarTheme.copyWith(
        color: AppColors.darkPrimaryColor,
        titleTextStyle: AppTypography.textSubtitle18Medium.copyWith(color: AppColors.colorWhite),
        elevation: 0,
      ),
      tabBarTheme: base.tabBarTheme.copyWith(
        indicator: BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(40),
        ),
        labelStyle: AppTypography.textSmall14Bold,
        labelColor: AppColors.darkSecondaryColor,
        unselectedLabelColor: AppColors.darkSecondaryVariant,
        unselectedLabelStyle: AppTypography.textSmall14Bold,
      ),
      bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColors.darkPrimaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.colorWhite,
        unselectedItemColor: AppColors.colorWhite,
      ),
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: AppColors.darkButtonColor,
        textTheme: ButtonTextTheme.primary,
        disabledColor: AppColors.lightPrimaryColorLight,
      ),
      iconTheme: base.iconTheme.copyWith(
        color: AppColors.darkIconColor,
        size: 24,
      ),
      sliderTheme: base.sliderTheme.copyWith(
        trackHeight: 2,
        thumbColor: AppColors.colorWhite,
        activeTrackColor: AppColors.darkAccentColor,
      ),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
        backgroundColor: AppColors.darkAccentColor,
        elevation: 0,
        highlightElevation: 0,
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        errorStyle: const TextStyle(fontSize: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.darkAccentColor.withOpacity(0.4),
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.colorInactiveBlack,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.darkErrorColor.withOpacity(0.4),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.darkErrorColor.withOpacity(0.4),
            width: 2,
          ),
        ),
      ),
      bottomSheetTheme: base.bottomSheetTheme.copyWith(
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static TextTheme _buildTextThemeDark(TextTheme base) {
    return base.copyWith(
      headline6: AppTypography.textSubtitle18Medium.copyWith(color: AppColors.colorWhite),
      headline5: AppTypography.textText16Medium.copyWith(color: AppColors.colorWhite),
      headline4: AppTypography.textTitle24Bold.copyWith(color: AppColors.colorWhite),
      headline3: AppTypography.textLargeTitle32Bold.copyWith(color: AppColors.colorWhite),
      subtitle1: AppTypography.textSmall14Bold.copyWith(color: AppColors.darkSecondaryVariant),
      subtitle2: AppTypography.textSmall14Bold.copyWith(color: AppColors.colorWhite),
      bodyText1: AppTypography.textSmall14Regular.copyWith(color: AppColors.colorWhite),
      bodyText2: AppTypography.textSmall14Regular.copyWith(color: AppColors.darkBackgroundColor),
      caption: AppTypography.textSuperSmall12Regular.copyWith(color: AppColors.colorWhite),
      button: AppTypography.textButton,
    );
  }

  static TextTheme _buildPrimaryTextThemeDark(TextTheme base) {
    return base.copyWith(
      headline6: AppTypography.textSubtitle18Medium.copyWith(color: AppColors.darkBackgroundColor),
      subtitle1: AppTypography.textText16Regular.copyWith(color: AppColors.darkOnPrimaryColor),
      bodyText1: AppTypography.textSmall14Regular.copyWith(color: AppColors.darkAccentColor),
      bodyText2: AppTypography.textSmall14Regular.copyWith(color: AppColors.darkBackgroundColor),
      caption: AppTypography.textSuperSmall12Medium.copyWith(color: AppColors.colorWhite),
    );
  }
}

/// постоянный цвет в обоих темах
extension CustomColorScheme on ColorScheme {
  Color get white => AppColors.colorWhite;

  Color get secondary => AppColors.colorSecondary;

  Color get secondary2 => AppColors.colorSecondary2;

  Color get inactiveBlack => AppColors.colorInactiveBlack;

  Color get green =>
      brightness == Brightness.light ? AppColors.colorWhiteGreen : AppColors.colorBlackGreen;

  Color get yellow =>
      brightness == Brightness.light ? AppColors.colorWhiteYellow : AppColors.colorBlackYellow;

  Color get green2 =>
      brightness == Brightness.light ? AppColors.colorWhiteGreen2 : AppColors.colorBlackGreen2;

  Color get yellow2 =>
      brightness == Brightness.light ? AppColors.colorWhiteYellow2 : AppColors.colorBlackYellow2;

  Color get accentColor =>
      brightness == Brightness.light ? AppColors.lightAccentColor : AppColors.darkAccentColor;
}

/// Тема для пикера - календарь, часы Андроид
ThemeData setThemePicker(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light
      ? ThemeData.light().copyWith(
          primaryColor: AppColors.colorPicker,
          colorScheme: const ColorScheme.light(
            primary: AppColors.colorPicker,
          ),
        )
      : ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: AppColors.colorBlackError,
            onPrimary: AppColors.colorWhite,
            surface: AppColors.colorBlackDark,
          ),
          dialogBackgroundColor: AppColors.colorBlackMain,
        );
}
