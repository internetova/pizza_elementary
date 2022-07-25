import 'package:elementary/elementary.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';

/// Default Elementary model for MainScreen module
class MainScreenModel extends ElementaryModel {
  final PlatformWidgetsFactory _widgetsFactory;

  /// CODE REVIEW
  /// 
  /// Мне кажется, что инжектить фабрику для производства UI-компонентов через
  /// Model - не очень хорошая идея.
  /// 
  /// Model старается максимально абстрагироваться от того, что происходит
  /// на UI. Даже если ты почитаешь документацию к классу [ErrorHandler],
  /// который необходим для Модели, то увидишь, что там стоит восклицательный
  /// знак на том, что его нельзя использовать для UI.
  PlatformWidgetsFactory get widgetsFactory => _widgetsFactory;

  MainScreenModel(
    ErrorHandler errorHandler,
    this._widgetsFactory,
  ) : super(errorHandler: errorHandler);
}
