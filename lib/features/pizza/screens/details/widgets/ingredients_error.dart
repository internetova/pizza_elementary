import 'package:flutter/material.dart';

/// Состояние ошибки при загрузке списка ингредиентов
class IngredientsError extends StatelessWidget {
  const IngredientsError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Что-то пошло не так'),
    );
  }
}
