import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData appTheme = ThemeData(
    textTheme: GoogleFonts.montserratTextTheme(),
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.primary,
      onSecondary: AppColors.onSecondary2,
      error: AppColors.error,
      onError: AppColors.onError,
      background: AppColors.background,
      onBackground: AppColors.onBackground,
      surface: AppColors.primary,
      onSurface: AppColors.onPrimary,
    ),
    appBarTheme: AppBarTheme(color: AppColors.primary),

    backgroundColor: AppColors.background,
    scaffoldBackgroundColor: AppColors.background,
    visualDensity: VisualDensity.adaptivePlatformDensity,

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.onTertiary2,
      selectionColor: AppColors.onTertiary2.withOpacity(0.65),
      selectionHandleColor: AppColors.onTertiary2.withOpacity(0.65),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.onBackground, fontSize: 18, fontWeight: FontWeight.w400),
    ),
  );
}
