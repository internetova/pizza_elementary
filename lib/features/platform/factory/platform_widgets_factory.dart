import 'package:flutter/widgets.dart';

abstract class PlatformWidgetsFactory {
  PreferredSizeWidget createAppBar({
    required String title,
    Widget? actionButton,
  });

  Widget createBottomNavigationBar({
    required int currentIndex,
    required ValueSetter<int> onTap,
  });

  Widget createLoader();

  PageRoute createPageRouter({
    required WidgetBuilder builder,
  });

  Future openModalBottomSheet({
    required BuildContext context,
    required WidgetBuilder builder,
  });

  Widget createButton({
    required Widget child,
    required VoidCallback? onPressed,
  });

  Widget createBottomSheet({
    required Widget child,
  });

  // ignore: long-parameter-list
  Widget createAlertDialog({
    required String title,
    String? content,
    required String titleLeftButton,
    required VoidCallback onLeftButton,
    required String titleRightButton,
    required VoidCallback onRightButton,
  });

  Future<T?> openAlertDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  });
}
