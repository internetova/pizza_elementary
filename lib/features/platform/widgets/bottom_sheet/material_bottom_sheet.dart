import 'package:flutter/material.dart';

class MaterialBottomSheet extends StatelessWidget {
  final Widget child;

  const MaterialBottomSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[4],
        color: theme.cardColor,
      ),
      child: child,
    );
  }
}
