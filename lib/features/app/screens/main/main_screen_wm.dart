import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pizza_elementary/features/app/di/app_scope.dart';
import 'package:pizza_elementary/features/app/screens/main/main_screen.dart';
import 'package:pizza_elementary/features/app/screens/main/main_screen_model.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';
import 'package:provider/provider.dart';

abstract class IMainScreenWidgetModel extends IWidgetModel {
  ListenableState<int> get tabState;

  PlatformWidgetsFactory get widgetsFactory;

  Widget get bottomNavigationBar;

  void switchTab(int tabIndex);
}

MainScreenWidgetModel defaultMainScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = MainScreenModel(appDependencies.errorHandler, appDependencies.widgetsFactory);

  return MainScreenWidgetModel(model);
}

/// Default widget model for MainScreenWidget
class MainScreenWidgetModel extends WidgetModel<MainScreen, MainScreenModel>
    implements IMainScreenWidgetModel {
  final _tabState = StateNotifier<int>(initValue: 0);

  @override
  ListenableState<int> get tabState => _tabState;

  @override
  PlatformWidgetsFactory get widgetsFactory => model.widgetsFactory;

  @override
  Widget get bottomNavigationBar => widgetsFactory.createBottomNavigationBar(
        currentIndex: _tabState.value ?? 0,
        onTap: switchTab,
      );

  MainScreenWidgetModel(MainScreenModel model) : super(model);

  @override
  void switchTab(int tabIndex) {
    _tabState.accept(tabIndex);
  }
}
