import 'package:flutter/material.dart';

/// Стартовый экран для теста запуска приложения
class TestStartScreen extends StatelessWidget {
  const TestStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Стартовый экран'),
      ),
    );
  }
}
