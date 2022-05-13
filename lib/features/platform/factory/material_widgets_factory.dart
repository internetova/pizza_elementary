import 'package:flutter/widgets.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';
import 'package:pizza_elementary/features/platform/widgets/material_widgets.dart';

class MaterialWidgetsFactory implements PlatformWidgetsFactory {
  const MaterialWidgetsFactory();

  @override
  PreferredSizeWidget createAppBar({
    required String title,
  }) =>
      MaterialAppBar(title: title);

  @override
  Widget createBottomNavigationBar({
    required int currentIndex,
    required ValueSetter<int> onTap,
  }) =>
      MaterialBottomNavigationBar(currentIndex: currentIndex, onTap: onTap);

  @override
  Widget createLoader() => const MaterialLoader();

  @override
  PageRoute createPageRouter({
    required WidgetBuilder builder,
  }) =>
      MaterialPageRouter(builder: builder);
}
