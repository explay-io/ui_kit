import 'package:ui_kit/colors/app_color.dart';
import 'package:flutter/material.dart';

import 'button_common.dart';

class FilledButton extends StatefulWidget {
  static void defaultOnPressed() {}

  final String text;
  final FutureCallback onPressed;
  final bool fullWidth;
  final bool narrow;
  final bool enabled;
  final TextStyle? textStyle;
  late final MaterialStateProperty<EdgeInsetsGeometry> padding;
  late final double fontSize;

  FilledButton(
    this.text, {
    this.onPressed = defaultOnPressed,
    this.fullWidth = false,
    this.narrow = false,
    this.enabled = true,
    padding,
    this.textStyle,
    Key? key,
  })  : super(key: key) {
    this.padding = MaterialStateProperty.resolveWith((_) => padding ?? getPadding(narrow: narrow));
    fontSize = getFontSize(narrow: narrow, fullWidth: fullWidth);
  }

  @override
  _FilledButtonState createState() => _FilledButtonState();
}

class _FilledButtonState extends State<FilledButton> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    final containerWidth = widget.fullWidth ? matchParentWidth(context) : null;

    final textStyle = widget.textStyle ?? Theme.of(context).textTheme.bodyText2!.copyWith(
      color: AppColor.deepWhite,
      fontSize: getFontSize(narrow: widget.narrow, fullWidth: widget.fullWidth)
    );

    return Container(
      width: containerWidth,
      child: ElevatedButton(
        onPressed: makeOnPressedCallback(
          enabled: _enabled && widget.enabled,
          onPressed: widget.onPressed,
          setEnabled: _setEnabled,
        ),
        style: ElevatedButton.styleFrom().copyWith(
          padding: widget.padding,
          elevation: ButtonStyleConstants.zeroElevation,
          backgroundColor: stateColor(defaultColor: AppColor.blue),
          shape: ButtonStyleConstants.rounded,
        ),
        child: Text(widget.text, style: textStyle),
      ),
    );
  }

  void _setEnabled(bool enabled) {
    if (_enabled != enabled) {
      setState(() => _enabled = enabled);
    }
  }
}
