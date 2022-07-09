import 'package:flutter/material.dart';
import 'package:pizza_elementary/assets/themes/custom_colors.dart';

class MaterialAlertDialogApp extends StatelessWidget {
  final String title;
  final String? content;
  final String titleLeftButton;
  final VoidCallback onLeftButton;
  final String titleRightButton;
  final VoidCallback onRightButton;

  const MaterialAlertDialogApp({
    Key? key,
    required this.title,
    this.content,
    required this.titleLeftButton,
    required this.onLeftButton,
    required this.titleRightButton,
    required this.onRightButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Text(
          title,
          style: theme.textTheme.headline5?.copyWith(color: theme.extension<CustomColors>()!.green),
        ),
      ),
      content: content != null ? Text(content!) : null,
      actions: [
        TextButton(
          child: Text(titleLeftButton),
          onPressed: onLeftButton,
        ),
        TextButton(
          child: Text(titleRightButton),
          onPressed: onRightButton,
        ),
      ],
    );
  }
}
