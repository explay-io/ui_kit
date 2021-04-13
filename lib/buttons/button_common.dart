import 'package:flutter/material.dart';
import 'package:ui_kit/colors/app_color.dart';

typedef FutureCallback = Future<void> Function();

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
}

mixin ButtonMixin {
  double matchParentWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  EdgeInsetsGeometry getPadding({bool narrow = false}) {
    return narrow
        ? ButtonStyleConstants.narrowPadding
        : ButtonStyleConstants.widePadding;
  }

  bool isDisabled({
    required bool enabled,
    FutureCallback? onPressed,
  }) {
    return !enabled || onPressed == null;
  }

  Color getTextColorOnWhiteBackground(
      {required bool enabled, bool? pressing, FutureCallback? onPressed}) {
    if (isDisabled(enabled: enabled, onPressed: onPressed)) {
      return AppColor.mediumGrey;
    }
    return pressing! ? AppColor.darkerBlue : AppColor.blue;
  }

  double getFontSize({required bool narrow, bool? fullWidth = false}) {
    if (_isSmall(narrow: narrow, fullWidth: fullWidth)) {
      return ButtonStyleConstants.smallFontSize;
    }
    return ButtonStyleConstants.fontSize;
  }

  Future<void> disableButtonWhileOnPressedExecutes({
    required EnabledSetter setEnabled,
    required FutureCallback onPressed,
  }) async {
    setEnabled(false);
    await onPressed();
    setEnabled(true);
  }

  bool _isSmall({required bool narrow, bool? fullWidth}) {
    return narrow && !fullWidth!;
  }
}
