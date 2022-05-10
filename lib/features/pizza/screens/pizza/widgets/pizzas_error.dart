import 'package:flutter/material.dart';

/// Состояние ошибки при загрузке пицц
/// Нет интернета и все остальные ошибки
class PizzasError extends StatelessWidget {
  const PizzasError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Что-то пошло не так'),
    );
  }
}
