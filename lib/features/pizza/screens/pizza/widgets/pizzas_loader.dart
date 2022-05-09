import 'package:flutter/material.dart';

/// Виджет для состояния загрузки пицц
class PizzasLoader extends StatelessWidget {
  const PizzasLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
