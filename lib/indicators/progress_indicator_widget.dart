import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        CircularProgressIndicator(),
      ],
    );
  }
}
