import 'package:flutter/material.dart';

typedef FutureVoidCallback = Future<void> Function();

typedef WidgetBuilder = Widget Function(BuildContext);

typedef DataValueChanged<T, D> = D Function(T value);

typedef DuoValueChanged<T, D> = void Function(T value, D secondValue);
