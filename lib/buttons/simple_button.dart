import 'package:ui_kit/colors/app_color.dart';
import 'package:flutter/material.dart';

import 'button_common.dart';

class SimpleButton extends StatefulWidget {
  static void defaultOnPressed() {}
  final String text;
  final FutureCallback onPressed;
  final bool enabled;
  late final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;

  SimpleButton(
    this.text, {
    this.padding = const EdgeInsets.symmetric(vertical: 17.5, horizontal: 18.5),
    this.onPressed = defaultOnPressed,
    this.textStyle,
    this.enabled = true,
    Key? key,
  })  : super(key: key);

  @override
  _SimpleButtonState createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> {
  bool _enabled = true;
  bool _pressing = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = widget.textStyle ?? Theme.of(context).textTheme.bodyText2!.copyWith(
      color: getTextColorOnWhiteBackground(
        enabled: _enabled && widget.enabled,
        pressing: _pressing,
        onPressed: widget.onPressed,
      ),
      fontSize: 12.0,
    );

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressing = true),
      onTapCancel: () => setState(() => _pressing = false),
      child: TextButton(
        onPressed: makeOnPressedCallback(
          enabled: _enabled && widget.enabled,
          onPressed: widget.onPressed,
          setEnabled: _setEnabled,
        ),
        style: TextButton.styleFrom(
          primary: AppColor.blue,
          padding: widget.padding,
        ).copyWith(shape: ButtonStyleConstants.rounded),
        child: Text(widget.text, style: textStyle),
      ),
    );
  }

  void _setEnabled(bool enabled) {
    setState(() => _enabled = enabled);
  }
}
