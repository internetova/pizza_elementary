import 'package:flutter/material.dart';

class MaterialAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? actionButton;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const MaterialAppBar({
    required this.title,
    this.actionButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: actionButton != null ? [actionButton!] : null,
    );
  }
}
