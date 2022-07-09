import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? actionButton;

  @override
  Size get preferredSize => const Size.fromHeight(
        kMinInteractiveDimensionCupertino,
      );

  const CupertinoAppBar({
    required this.title,
    this.actionButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CupertinoNavigationBar(
      backgroundColor: theme.cardColor,
      middle: Text(title),
      trailing: actionButton,
      transitionBetweenRoutes: false,
    );
  }
}
