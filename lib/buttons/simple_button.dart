import 'package:ui_kit/colors/app_color.dart';
import 'package:flutter/material.dart';

import 'button_common.dart';

class SimpleButton extends StatefulWidget {
  final String text;
  final FutureCallback onPressed;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;

  SimpleButton(
    this.text, {
    @required this.onPressed,
    this.padding,
    this.textStyle,
    Key key,
  })  : assert(text != null),
        super(key: key);

  @override
  _SimpleButtonState createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> with ButtonMixin {
  bool _enabled = true;
  bool _pressing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _pressing = true);
      },
      onTapCancel: () {
        setState(() => _pressing = false);
      },
      child: TextButton(
        onPressed: isDisabled(enabled: _enabled, onPressed: widget.onPressed)
            ? null
            : () => disableButtonWhileOnPressedExecutes(
                setEnabled: _setEnabled, onPressed: widget.onPressed),
        style: TextButton.styleFrom(
          primary: AppColor.blue,
          padding: widget.padding ??
              const EdgeInsets.symmetric(vertical: 17.5, horizontal: 18.5),
        ).copyWith(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        child: Text(
          widget.text,
          style: widget.textStyle ??
              Theme.of(context).textTheme.bodyText2.copyWith(
                    color: getTextColorOnWhiteBackground(
                      enabled: _enabled,
                      pressing: _pressing,
                      onPressed: widget.onPressed,
                    ),
                    fontSize: 12.0,
                  ),
        ),
      ),
    );
  }

  void _setEnabled(bool enabled) {
    setState(() => _enabled = enabled);
  }
}
