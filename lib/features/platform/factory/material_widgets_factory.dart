import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';
import 'package:pizza_elementary/features/platform/widgets/material_widgets.dart';

class MaterialWidgetsFactory implements PlatformWidgetsFactory {
  const MaterialWidgetsFactory();

  @override
  PreferredSizeWidget createAppBar({
    required String title,
    Widget? actionButton,
  }) {
    return MaterialAppBar(title: title);
  }

  @override
  Widget createBottomNavigationBar({
    required int currentIndex,
    required ValueSetter<int> onTap,
  }) {
    return MaterialBottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }

  @override
  Widget createLoader() => const MaterialLoader();

  @override
  PageRoute createPageRouter({
    required WidgetBuilder builder,
  }) {
    return MaterialPageRouter(builder: builder);
  }

  @override
  Future openModalBottomSheet({
    required BuildContext context,
    required WidgetBuilder builder,
  }) {
    return showMaterialModalBottomSheet<void>(
      context: context,
      builder: builder,
    );
  }

  @override
  Widget createButton({
    required Widget child,
    VoidCallback? onPressed,
  }) {
    return CustomMaterialButton(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget createBottomSheet({required Widget child}) {
    return MaterialBottomSheet(
      child: child,
    );
  }

  @override
  // ignore: long-parameter-list
  Widget createAlertDialog({
    required String title,
    String? content,
    required String titleLeftButton,
    required VoidCallback onLeftButton,
    required String titleRightButton,
    required VoidCallback onRightButton,
  }) {
    return MaterialAlertDialogApp(
      title: title,
      content: content,
      titleLeftButton: titleLeftButton,
      onLeftButton: onLeftButton,
      titleRightButton: titleRightButton,
      onRightButton: onRightButton,
    );
  }

  @override
  Future<T?> openAlertDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) {
    return showDialog<T>(
      context: context,
      builder: builder,
    );
  }
}
