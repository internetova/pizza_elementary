import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pizza_elementary/features/platform/factory/platform_widgets_factory.dart';
import 'package:pizza_elementary/features/platform/widgets/cupertino_widgets.dart';

class CupertinoWidgetsFactory implements PlatformWidgetsFactory {
  const CupertinoWidgetsFactory();

  @override
  PreferredSizeWidget createAppBar({
    required String title,
    Widget? actionButton,
  }) {
    return CupertinoAppBar(title: title, actionButton: actionButton);
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
  // ignore: long-parameter-list
  Widget createAlertDialog({
    required String title,
    String? content,
    required String titleLeftButton,
    required VoidCallback onLeftButton,
    required String titleRightButton,
    required VoidCallback onRightButton,
  }) {
    return CupertinoAlertDialogApp(
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
    return showCupertinoModalPopup(
      context: context,
      builder: builder,
    );
  }
}
