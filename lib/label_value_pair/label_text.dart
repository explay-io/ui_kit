import 'package:flutter/material.dart';
import 'package:ui_kit/colors/app_color.dart';

class LabelText extends StatelessWidget {
  final String data;

  const LabelText(this.data);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(
      data,
      style: theme.bodyText2.copyWith(
          color: AppColor.semiGrey,
          fontSize: 12.0,
          fontFamily: 'Circular',
          letterSpacing: 1.0,
          height: 1.0,
          fontWeight: FontWeight.bold),
    );
  }
}
