import 'package:flutter/material.dart';

class AmountText extends StatelessWidget {
  final String data;
  final EdgeInsets padding;

  const AmountText(
      {@required this.data, this.padding = const EdgeInsets.all(6.0)});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: padding,
      child: Text(
        data,
        style:
            theme.bodyText2.copyWith(fontWeight: FontWeight.bold, fontSize: 16.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
