import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color primaryColor = Color(0xFF3EB5DB);
  static const Color primary = Color(0xFF3EB5DB);
  static const Color primaryColorDarker = Color(0xFF02a5bd);
  static const Color secondary = Color(0xFF3EB5DB);
  static const Color secondaryLight = Color(0xFF3EB5DB);
  static const Color colorNeutralLight = Color(0xFFcccccc);
  static const Color warning = Color(0xFFFFC9C0);
  static const Color hint = Color(0x8A000000);

  static const LinearGradient buttonGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color.fromARGB(255, 62, 219, 181),
        Color.fromARGB(255, 86, 244, 200)
      ]);

  static const LinearGradient headingGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color.fromARGB(255, 62, 219, 181),
        Color.fromARGB(255, 31, 197, 236),
      ]);

  static const LinearGradient circleButtonGradient = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Color(0xFF30cab2),
        Color(0xFF4fe1c1),
        Color(0xFF50e3c2),
      ]);
}
