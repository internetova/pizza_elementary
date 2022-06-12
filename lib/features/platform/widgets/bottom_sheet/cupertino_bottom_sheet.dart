import 'package:flutter/material.dart';

class CupertinoBottomSheet extends StatelessWidget {
  final Widget child;

  const CupertinoBottomSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
      height: 96,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[4],
        color: theme.cardColor,
      ),
      child: child,
    );
  }
}
