import 'package:flutter/material.dart';

mixin AppTheme {
  static const primary = Color(0xFF035661);
  static const primaryVariant = Color(0xFF12818D);
  static const onPrimary = Color(0xFF212121);
  static const secondary = Color(0xFF536DFE);
  static const secondaryVariant = Color(0xF3C8DAFF);
  static const onSecondary = Color(0xFF757575);
  static const surface = Color(0xFFFFFFFF);
  static const onSurface = Color(0xFF00BCD4);
  static const background = Color(0xFFFFFFFF);
  static const onBackground = Color(0xFFB2EBF2);
  static const error = Color(0xFF2953D2);
  static const inactiveColor = Color(0xFF8D8D8D);

  static ThemeData get getThemeData => ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.light(
          primary: primary,
          primaryContainer: primaryVariant,
          onPrimary: onPrimary,
          secondary: secondary,
          secondaryContainer: secondaryVariant,
          onSecondary: onSecondary,
          surface: surface,
          onSurface: onSurface,
          background: Colors.grey.withOpacity(.05),//background,
          onBackground: onBackground,
          error: error,
        ),
        buttonTheme: const ButtonThemeData(
          colorScheme: ColorScheme.light(
            primary: primary,
          ),
        ),
        textTheme: const TextTheme(
          // Main subtitle
          displayLarge: TextStyle(
            fontSize: 55,
            color: primary,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
          ),
          // Highlighted subtitle
          displayMedium: TextStyle(
            fontSize: 55,
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
            color: onSurface,
            fontFamily: 'Montserrat',
          ),
          bodyLarge: TextStyle(
            color: primary,
            fontSize: 30,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
          bodyMedium: TextStyle(
            fontSize: 28,
            color: primary,
            letterSpacing: 4,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat',
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            color: primary,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
          titleSmall: TextStyle(
            fontSize: 18,
            color: primaryVariant,
            letterSpacing: 1,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat',
          ),
          // Button style
          labelLarge: TextStyle(
            fontSize: 14,
            color: primary,
            fontFamily: 'Montserrat',
            letterSpacing: 1,
          ),
        ),
      );
}
