import 'package:elementary/elementary.dart';
import 'package:pizza_elementary/util/default_error_handler.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  late final ErrorHandler _errorHandler;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  /// Create an instance [AppScope].
  AppScope() : _errorHandler = DefaultErrorHandler();
}

/// App dependencies.
abstract class IAppScope {
  /// Interface for handle error in business logic.
  ErrorHandler get errorHandler;
}
