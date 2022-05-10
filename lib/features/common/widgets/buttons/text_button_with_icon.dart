import 'package:flutter/material.dart';
import 'package:pizza_elementary/assets/themes/themes.dart';

class TextButtonWithIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const TextButtonWithIcon({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: TextButton.styleFrom(
        primary: theme.cardColor,
        backgroundColor: theme.colorScheme.green,
      ),
    );
  }
}
