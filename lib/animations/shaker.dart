import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';

class Shaker extends StatelessWidget {
  final bool canShake;
  final Widget child;
  final Duration shakeDuration;

  Shaker({@required this.canShake, @required this.child, @required this.shakeDuration});

  @override
  Widget build(BuildContext context) {
    return TranslationAnimatedWidget(
      enabled: canShake,
      duration: shakeDuration,
      values: const [
        Offset(0, 0),
        Offset(50, 0),
        Offset(-50, 0),
        Offset(50, 0),
        Offset(-50, 0),
        Offset(0, 0),
      ],
      child: child,
    );
  }
}
