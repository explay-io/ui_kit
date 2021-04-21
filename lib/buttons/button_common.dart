import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ui_kit/colors/app_color.dart';

typedef FutureCallback = FutureOr<void> Function();

typedef EnabledSetter = void Function(bool enabled);

class ButtonStyleConstants {
  static const double narrowVerticalPadding = 11.5;
  static const double wideVerticalPadding = 17.5;
  static const double horizontalPadding = 48.0;
  static const EdgeInsetsGeometry narrowPadding = EdgeInsets.symmetric(
      vertical: narrowVerticalPadding, horizontal: horizontalPadding);
  static const EdgeInsetsGeometry widePadding = EdgeInsets.symmetric(
      vertical: wideVerticalPadding, horizontal: horizontalPadding);
  static const double fontSize = 16.0;
  static const double smallFontSize = 14.0;

  static final zeroElevation = MaterialStateProperty.resolveWith((_) => 0.0);
  static final rounded = MaterialStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
  );
}

final stateColor = ({
  Color? defaultColor,
  Color? disabled = AppColor.mediumGrey,
  Color? pressed = AppColor.darkerBlue,
}) =>
  MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return disabled;
  }
  if (states.contains(MaterialState.pressed)) {
    return pressed;
  }
  return defaultColor; // Defer to the widget's default.
});

EdgeInsetsGeometry getPadding({bool narrow = false}) {
  return narrow
      ? ButtonStyleConstants.narrowPadding
      : ButtonStyleConstants.widePadding;
}

double getFontSize({required bool narrow, bool fullWidth = false}) {
  if (_isSmall(narrow: narrow, fullWidth: fullWidth)) {
    return ButtonStyleConstants.smallFontSize;
  }
  return ButtonStyleConstants.fontSize;
}

bool _isSmall({required bool narrow, bool? fullWidth}) {
  return narrow && !fullWidth!;
}

Color getTextColorOnWhiteBackground(
    {required bool enabled, required bool pressing}) {
  if (!enabled) {
    return AppColor.mediumGrey;
  }
  return pressing ? AppColor.darkerBlue : AppColor.blue;
}

Future<void> disableButtonWhileOnPressedExecutes({
  required EnabledSetter setEnabled,
  required FutureCallback onPressed,
}) async {
  setEnabled(false);
  await onPressed();
  setEnabled(true);
}

double matchParentWidth(BuildContext context) =>
  MediaQuery.of(context).size.width;

Function()? makeOnPressedCallback ({
  required bool enabled,
  required FutureCallback onPressed,
  required void Function(bool enabled) setEnabled,
}) {
  return !enabled
    ? null
    : () => disableButtonWhileOnPressedExecutes(
        setEnabled: setEnabled, onPressed: onPressed);
}
