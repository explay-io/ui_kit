import 'package:ui_kit/colors/app_color.dart';
import 'package:flutter/material.dart';

import 'button_common.dart';

class ContourButton extends StatefulWidget {
  final String text;
  final FutureCallback onPressed;
  final bool fullWidth;
  final bool narrow;
  final EdgeInsetsGeometry padding;

  ContourButton(
    this.text, {
    @required this.onPressed,
    this.fullWidth = false,
    this.narrow = false,
    this.padding,
    Key key,
  })  : assert(text != null),
        super(key: key);

  @override
  _ContourButtonState createState() => _ContourButtonState();
}

class _ContourButtonState extends State<ContourButton> with ButtonMixin {
  bool _enabled = true;
  bool _pressing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.fullWidth ? matchParentWidth(context) : null,
      child: GestureDetector(
        onTapDown: (_) {
          setState(() => _pressing = true);
        },
        onTapCancel: () {
          setState(() => _pressing = false);
        },
        child: OutlinedButton(
          onPressed: isDisabled(enabled: _enabled, onPressed: widget.onPressed)
              ? null
              : () => disableButtonWhileOnPressedExecutes(
                  setEnabled: _setEnabled, onPressed: widget.onPressed),
          style: OutlinedButton.styleFrom(
            padding: widget.padding ?? getPadding(narrow: widget.narrow),
            side: BorderSide(color: AppColor.darkerBlue),
          ).copyWith(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          child: Text(
            widget.text,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: getTextColorOnWhiteBackground(
                    enabled: _enabled,
                    pressing: _pressing,
                    onPressed: widget.onPressed,
                  ),
                  fontSize: getFontSize(
                      narrow: widget.narrow, fullWidth: widget.fullWidth),
                ),
          ),
        ),
      ),
    );
  }

  void _setEnabled(bool enabled) {
    setState(() => _enabled = enabled);
  }
}
