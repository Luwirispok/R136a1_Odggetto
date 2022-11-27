import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF000000);
  static const Color onBackground = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF111111);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static Color tertiary = const Color(0xFF151515).withOpacity(0.75);
  static const Color onTertiary1 = Color(0xFFFFFFFF);
  static const Color onTertiary2 = Color(0xFFFFED00);
  static LinearGradient secondary = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFFFED00),
      Color(0xFFFDC200),
    ],
  );
  static const Color onSecondary1 = Color(0xFF000000);
  static const Color onSecondary2 = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF151515);
  static const Color white = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFFC5230);
  static const Color onError = Color(0xFFFFFFFF);
}
