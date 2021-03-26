import 'package:ui_kit/color.dart';
import 'package:flutter/material.dart';

import 'button_common.dart';

class FilledButton extends StatefulWidget {
  final String text;
  final FutureCallback onPressed;
  final bool fullWidth;
  final bool narrow;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;

  FilledButton(
    this.text, {
    @required this.onPressed,
    this.fullWidth = false,
    this.narrow = false,
    this.padding,
    this.textStyle,
    Key key,
  })  : assert(text != null),
        super(key: key);

  @override
  _FilledButtonState createState() => _FilledButtonState();
}

class _FilledButtonState extends State<FilledButton> with ButtonMixin {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.fullWidth ? matchParentWidth(context) : null,
      child: ElevatedButton(
        onPressed: isDisabled(enabled: _enabled, onPressed: widget.onPressed)
            ? null
            : () => disableButtonWhileOnPressedExecutes(
                setEnabled: _setEnabled, onPressed: widget.onPressed),
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            (Set<MaterialState> states) =>
              widget.padding ?? getPadding(narrow: widget.narrow),
          ),
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) => 0.0,
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
        child: Text(
          widget.text,
          style: (widget.textStyle != null) ? widget.textStyle :
            Theme.of(context).textTheme.bodyText2.copyWith(
              color: AppColor.deepWhite,
              fontSize: getFontSize(narrow: widget.narrow, fullWidth: widget.fullWidth)
            ),
        ),
      ),
    );
  }

  void _setEnabled(bool enabled) {
    if (_enabled != enabled) {
      setState(() => _enabled = enabled);
    }
  }
}
