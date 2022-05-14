import 'package:elementary/elementary.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';

/// Default Elementary model for MainScreen module
class MainScreenModel extends ElementaryModel {
  final PlatformWidgetsFactory _widgetsFactory;

  PlatformWidgetsFactory get widgetsFactory => _widgetsFactory;

  MainScreenModel(
    ErrorHandler errorHandler,
    this._widgetsFactory,
  ) : super(errorHandler: errorHandler);
}
