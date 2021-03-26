import 'dart:async';

import 'package:ui_kit/colors/app_color.dart';
import 'package:flutter/material.dart';

import 'button_common.dart';

class TwoStatesButton extends StatefulWidget {
  final String initialText;
  final String finalText;
  final int timeIntervalInSec;
  final Function onButtonCallback;
  final FutureCallback onPressed;
  final bool fullWidth;
  final bool narrow;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;
  final bool resetButtonOnBuild;

  TwoStatesButton(
    this.initialText,
    this.finalText,
    this.timeIntervalInSec, {
    @required this.onButtonCallback,
    @required this.onPressed,
    this.fullWidth = false,
    this.narrow = false,
    this.padding,
    this.textStyle,
    this.resetButtonOnBuild = false,
    Key key,
  })  : assert(initialText != null),
        super(key: key);

  @override
  _TwoStatesButtonState createState() => _TwoStatesButtonState();
}

class _TwoStatesButtonState extends State<TwoStatesButton> with ButtonMixin {
  bool _enabled = true;
  Timer _timer;
  String _currentText;
  bool _resetState = false;

  @override
  void initState() {
    super.initState();
    _resetState = widget.resetButtonOnBuild;
    _startTimer();
  }

  void _startTimer() {
    setState(() => _currentText = widget.initialText);
    _timer = Timer(Duration(seconds: widget.timeIntervalInSec), () {
      _resetState = false;
      setState(() => _currentText = widget.finalText);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _resetTimer() {
    if (_resetState) {
      if (_timer.isActive) {
        _timer.cancel();
      }
      _startTimer();
    } else {
      _resetState = widget.resetButtonOnBuild;
    }
  }

  @override
  Widget build(BuildContext context) {
    _resetTimer();
    return Container(
      width: widget.fullWidth ? matchParentWidth(context) : null,
      child: ElevatedButton(
        onPressed: isDisabled(enabled: _enabled, onPressed: widget.onPressed)
            ? null
            : () {
                if (_timer.isActive) {
                  disableButtonWhileOnPressedExecutes(
                      setEnabled: _setEnabled, onPressed: widget.onPressed);
                } else {
                  _startTimer();
                  widget.onButtonCallback();
                }
              },
        style: ElevatedButton.styleFrom(
          padding: widget.padding ?? getPadding(narrow: widget.narrow),
          primary: AppColor.deepWhite,
        ).copyWith(
          elevation: MaterialStateProperty.resolveWith<double>(
              (Set<MaterialState> states) {
            return 0.0;
          }),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColor.mediumGrey;
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColor.darkerBlue;
            }
            return null; // Defer to the widget's default.
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColor.deepWhite;
            }
            return null; // Defer to the widget's default.
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        child: Text(
          _currentText,
          style: widget.textStyle ??
              Theme.of(context).textTheme.bodyText2.copyWith(
                  color: AppColor.deepWhite,
                  fontSize: getFontSize(
                      narrow: widget.narrow, fullWidth: widget.fullWidth)),
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
