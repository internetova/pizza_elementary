import 'package:flutter/cupertino.dart';

class CupertinoPageRouter extends PageRoute<void> with CupertinoRouteTransitionMixin {
  final WidgetBuilder builder;

  @override
  bool get maintainState => false;

  @override
  String get title => '';

  CupertinoPageRouter({
    required this.builder,
  });

  @override
  Widget buildContent(BuildContext context) => builder(context);
}
