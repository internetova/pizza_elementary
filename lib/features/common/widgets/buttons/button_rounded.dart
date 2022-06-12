import 'package:flutter/material.dart';

/// элемент интерфейса - небольшая закругленная квадратная или круглая кнопка,
class ButtonRounded extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final double radius;
  final IconData iconData;
  final VoidCallback onPressed;
  final double? elevation;

  const ButtonRounded({
    Key? key,
    required this.size,
    required this.backgroundColor,
    required this.radius,
    required this.iconData,
    required this.onPressed,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(
        Size(size, size),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          elevation: elevation,
        ),
        child: Icon(iconData),
        onPressed: onPressed,
      ),
    );
  }
}
