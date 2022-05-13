import 'package:flutter/widgets.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';
import 'package:pizza_elementary/features/platform/widgets/cupertino_widgets.dart';

class CupertinoWidgetsFactory implements PlatformWidgetsFactory {
  const CupertinoWidgetsFactory();

  @override
  PreferredSizeWidget createAppBar({
    required String title,
  }) =>
      CupertinoAppBar(title: title);

  @override
  Widget createBottomNavigationBar({
    required int currentIndex,
    required ValueSetter<int> onTap,
  }) =>
      CupertinoBottomNavigationBar(currentIndex: currentIndex, onTap: onTap);

  @override
  Widget createLoader() => const CupertinoLoader();

  @override
  PageRoute createPageRouter({
    required WidgetBuilder builder,
  }) =>
      CupertinoPageRouter(builder: builder);
}
