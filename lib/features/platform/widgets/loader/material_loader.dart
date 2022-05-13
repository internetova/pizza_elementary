import 'package:flutter/material.dart';

class MaterialLoader extends StatelessWidget {
  const MaterialLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
