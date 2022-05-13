import 'package:flutter/material.dart';

class MaterialPageRouter extends PageRoute<void> with MaterialRouteTransitionMixin {
  final WidgetBuilder builder;

  @override
  bool get maintainState => false;

  MaterialPageRouter({
    required this.builder,
  });

  @override
  Widget buildContent(BuildContext context) => builder(context);
}
