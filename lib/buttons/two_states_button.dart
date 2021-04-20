import 'dart:async';

import 'package:ui_kit/colors/app_color.dart';
import 'package:flutter/material.dart';

import 'button_common.dart';

class TwoStatesButton extends StatefulWidget {
  static void defaultOnPressed() {}
  static void defaultOnButtonCallback() {}

  final String initialText;
  final String finalText;
  final int timeIntervalInSec;
  final Function onButtonCallback;
  final FutureCallback onPressed;
  final bool fullWidth;
  final bool narrow;
  final TextStyle? textStyle;
  final bool resetButtonOnBuild;
  final bool enabled;

  late final EdgeInsetsGeometry padding;
  late final double fontSize;

  TwoStatesButton(
    this.initialText,
    this.finalText,
    this.timeIntervalInSec, {
    this.onButtonCallback = defaultOnButtonCallback,
    this.onPressed = defaultOnPressed,
    this.fullWidth = false,
    this.narrow = false,
    this.enabled = true,
    padding,
    this.textStyle,
    this.resetButtonOnBuild = false,
    Key? key,
  }) : super(key: key) {
    this.padding = padding ?? getPadding(narrow: narrow);
    fontSize = getFontSize(narrow: narrow, fullWidth: fullWidth);
  }

  @override
  _TwoStatesButtonState createState() => _TwoStatesButtonState();
}

class _TwoStatesButtonState extends State<TwoStatesButton> {
  bool _enabled = true;
  late Timer _timer;
  String _currentText = '';
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

  void handlePress() {
    if (_timer.isActive) {
      disableButtonWhileOnPressedExecutes(
          setEnabled: _setEnabled, onPressed: widget.onPressed);
    } else {
      _startTimer();
      widget.onButtonCallback();
    }
  }

  @override
  Widget build(BuildContext context) {
    _resetTimer();

    final containerWidth = widget.fullWidth ? matchParentWidth(context) : null;

    final buttonStyle = ElevatedButton.styleFrom(
      padding: widget.padding,
      primary: AppColor.deepWhite,
    ).copyWith(
      elevation: ButtonStyleConstants.zeroElevation,
      backgroundColor: stateColor(),
      foregroundColor: stateColor(disabled: AppColor.deepWhite, pressed: null),
      shape: ButtonStyleConstants.rounded,
    );

    return Container(
      width: containerWidth,
      child: ElevatedButton(
        onPressed: makeOnPressedCallback(
          enabled: _enabled && widget.enabled,
          onPressed: handlePress,
          setEnabled: _setEnabled,
        ),
        style: buttonStyle,
        child: Text(
          _currentText,
          style: widget.textStyle ?? Theme.of(context).textTheme.bodyText2!.copyWith(
            color: AppColor.deepWhite,
            fontSize: widget.fontSize,
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
