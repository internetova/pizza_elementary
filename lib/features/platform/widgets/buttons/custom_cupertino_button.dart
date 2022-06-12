import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_elementary/assets/themes/custom_colors.dart';
import 'package:pizza_elementary/features/common/constants/app_sizes.dart';

class CustomCupertinoButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const CustomCupertinoButton({
    required this.child,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CupertinoButton(
      onPressed: onPressed,
      child: child,
      color: theme.extension<CustomColors>()!.green,
      borderRadius: const BorderRadius.all(Radius.circular(AppSizes.radiusCard)),
    );
  }
}
