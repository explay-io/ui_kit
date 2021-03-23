import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();
  static const int changeBlue = 0xFF2196F3;
  static const Color blue = Color(changeBlue);
  static const Color blueSwatch = MaterialColor(changeBlue, {
    50: Color(0xFFE8FBF6),
    100: Color(0xFFC5F4E9),
    200: Color(0xFF9FEDDA),
    300: Color(0xFF78E6CB),
    400: Color(0xFF5BE0C0),
    500: blue,
    600: Color(0xFF38D7AE),
    700: Color(0xFF30D2A5),
    800: Color(0xFF28CD9D),
    900: Color(0xFF1BC48D),
  });
  static Color paleBlue = blue.withOpacity(0.2);
  static const Color darkerBlue = Color(0xFF0D47A1);
  static const Color brightBlue = Color(0xFF4CE2A7);

  static const Color deepBlack = Color(0xFF000000);
  static const Color deepWhite = Color(0xFFFFFFFF);

  static const Color red = Color(0xFFFF6B6B);

  static const Color veryLightGrey = Color(0xFFF7F7F7);
  static const Color lightestGrey = Color(0xFFEDEFF2);
  static const Color grey = Color(0xFFE7E7E7);
  static const Color mediumGrey = Color(0xFFE7E7E7);
  static const Color semiGrey = Color(0xFF9DA0A6);

  static const Color shadowColor = Color(0x1f0D0F10);
}
