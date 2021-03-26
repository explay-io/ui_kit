import 'package:ui_kit/color.dart';
import 'package:flutter/material.dart';

import 'button_common.dart';

class OutlinedButton extends StatefulWidget {
  final String text;
  final FutureCallback onPressed;
  final bool fullWidth;
  final bool narrow;
  final EdgeInsetsGeometry padding;

  OutlinedButton(
    this.text, {
    @required this.onPressed,
    this.fullWidth = false,
    this.narrow = false,
    this.padding,
    Key key,
  })  : assert(text != null),
        super(key: key);

  @override
  _OutlinedButtonState createState() => _OutlinedButtonState();
}

class _OutlinedButtonState extends State<OutlinedButton> with ButtonMixin {
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
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            (Set<MaterialState> states) =>
              widget.padding ?? getPadding(narrow: widget.narrow),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColor.darkerBlue;
              } else if (states.contains(MaterialState.disabled)) {
                return AppColor.mediumGrey;
              }

              return AppColor.blue;
            },
          ),
        ),
          // textColor: AppColor.blue,
          borderSide: const BorderSide(color: AppColor.blue),
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
