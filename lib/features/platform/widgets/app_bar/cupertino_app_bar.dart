import 'package:flutter/cupertino.dart';

class CupertinoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(
        kMinInteractiveDimensionCupertino,
      );

  const CupertinoAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(title),
    );
  }
}
