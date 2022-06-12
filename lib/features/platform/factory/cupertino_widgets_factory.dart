import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';
import 'package:pizza_elementary/features/platform/widgets/cupertino_widgets.dart';

class CupertinoWidgetsFactory implements PlatformWidgetsFactory {
  const CupertinoWidgetsFactory();

  @override
  PreferredSizeWidget createAppBar({
    required String title,
  }) {
    return CupertinoAppBar(title: title);
  }

  @override
  Widget createBottomNavigationBar({
    required int currentIndex,
    required ValueSetter<int> onTap,
  }) {
    return CupertinoBottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }

  @override
  Widget createLoader() => const CupertinoLoader();

  @override
  PageRoute createPageRouter({
    required WidgetBuilder builder,
  }) {
    return CupertinoPageRouter(builder: builder);
  }

  @override
  Future openModalBottomSheet({
    required BuildContext context,
    required WidgetBuilder builder,
  }) {
    return showCupertinoModalBottomSheet<void>(
      context: context,
      builder: builder,
    );
  }

  @override
  Widget createButton({
    required Widget child,
    required VoidCallback? onPressed,
  }) {
    return CustomCupertinoButton(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget createBottomSheet({required Widget child}) {
    return CupertinoBottomSheet(
      child: child,
    );
  }

  @override
  Widget createSizedBox() {
    return const CupertinoSizedBox();
  }
}
