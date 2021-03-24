import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();
  static const Color blue = Color(0xFF3EB5DB);
  static const Color blueSwatch = MaterialColor(0xFF3EB5DB, {
    50: Color(0xFFE8F6FB),
    100: Color(0xFFC5E9F4),
    200: Color(0xFF9FDAED),
    300: Color(0xFF78CBE6),
    400: Color(0xFF5BC0E0),
    500: blue,
    600: Color(0xFF38AED7),
    700: Color(0xFF30A5D2),
    800: Color(0xFF289DCD),
    900: Color(0xFF1B8DC4),
  });
  static Color paleBlue = blue.withOpacity(0.2);
  static const Color darkerBlue = Color(0xFF39A8CC);
  static const Color brightBlue = Color(0xFF4CA7E2);

  static const Color deepBlack = Color(0xFF000000);
  static const Color deepWhite = Color(0xFFFFFFFF);

  static const Color red = Color(0xFFFF6B6B);

  static const Color veryLightGrey = Color(0xFFF7F7F7);
  static const Color lightestGrey = Color(0xFFEDEFF2);
  static const Color grey = Color(0xFFE7E7E7);
  static const Color mediumGrey = Color(0xFFE7E7E7);
  static const Color semiGrey = Color(0xFF9DA0A6);

  static const Color green = Color(0xFF39CCA8);

  static const Color shadowColor = Color(0x1f0D0F10);
}
