import 'package:ui_kit/colors/app_color.dart';
import 'package:flutter/material.dart';

import 'button_common.dart';

class ContourButton extends StatefulWidget {
  static void defaultOnPressed() {}

  final String text;
  final FutureCallback onPressed;
  final bool fullWidth;
  final bool narrow;
  final bool enabled;
  late final EdgeInsetsGeometry padding;
  late final double fontSize;

  ContourButton(
    this.text, {
    this.onPressed = defaultOnPressed,
    this.fullWidth = false,
    this.narrow = false,
    this.enabled = true,
    padding,
    Key? key,
  }) : super(key: key) {
    this.padding = padding ?? getPadding(narrow: narrow);
    fontSize = getFontSize(narrow: narrow, fullWidth: fullWidth);
  }

  @override
  _ContourButtonState createState() => _ContourButtonState();
}

class _ContourButtonState extends State<ContourButton> {
  bool _enabled = true;
  bool _pressing = false;

  @override
  Widget build(BuildContext context) {
    final containerWidth = widget.fullWidth ? matchParentWidth(context) : null;

    final textColor = getTextColorOnWhiteBackground(
      enabled: _enabled && widget.enabled,
      pressing: _pressing,
      onPressed: widget.onPressed,
    );
    final textStyle = Theme.of(context).textTheme.bodyText2!.copyWith(color: textColor, fontSize: widget.fontSize);

    return Container(
      width: containerWidth,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressing = true),
        onTapCancel: () => setState(() => _pressing = false),
        child: OutlinedButton(
          onPressed: makeOnPressedCallback(
            enabled: _enabled && widget.enabled,
            onPressed: widget.onPressed,
            setEnabled: _setEnabled
          ),
          style: OutlinedButton.styleFrom(
            padding: widget.padding,
            side: BorderSide(color: AppColor.darkerBlue),
          ).copyWith(shape: ButtonStyleConstants.rounded),
          child: Text(
            widget.text,
            style: textStyle,
          ),
        ),
      ),
    );
  }

  void _setEnabled(bool enabled) {
    setState(() => _enabled = enabled);
  }
}
