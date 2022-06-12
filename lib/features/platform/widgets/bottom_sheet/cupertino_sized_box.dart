import 'package:flutter/material.dart';

/// Отступ под боттом шит чтобы прокрутить контент под ним
class CupertinoSizedBox extends StatelessWidget {
  const CupertinoSizedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 120,
    );
  }
}
