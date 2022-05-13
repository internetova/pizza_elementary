import 'package:flutter/cupertino.dart';

class CupertinoLoader extends StatelessWidget {
  const CupertinoLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(radius: 20),
    );
  }
}
