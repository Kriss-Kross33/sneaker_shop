import 'package:flutter/material.dart';
import 'package:sneaker_shop/src/utils/constants/constants.dart';

/// {@template app_theme}
/// A class that manages the app's theme.
/// {@endtemplate}
class AppTheme {
  /// {@macro app_theme}
  const AppTheme._();

  /// The font family used in the app
  static const String fontFamily = 'Teko';

  /// The default theme applied in the app
  static ThemeData get defaultTheme => darkTheme;

  /// Light theme data
  static ThemeData lightTheme = ThemeData(
    fontFamily: fontFamily,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(elevation: 0),
    colorScheme: const ColorScheme.light(
      primary: AppColor.black,
      primaryContainer: AppColor.white,
      onPrimary: AppColor.black,
      secondary: AppColor.white,
      onSecondary: AppColor.white,
    ),
    scaffoldBackgroundColor: AppColor.alabaster,
    buttonTheme: _lightButtonThemeData,
    textTheme: _lightTextTheme,
    iconButtonTheme: _lightIconTheme,
    cardTheme: _lightCardTheme,
  );

  /// Button theme data
  static final ButtonThemeData _darkButtonThemeData = ButtonThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColor.white,
    ),
    disabledColor: Colors.grey.shade300,
  );

  static const CardTheme _darkCardTheme = CardTheme(
    color: AppColor.alabaster,
  );

  static const CardTheme _lightCardTheme = CardTheme(
    color: AppColor.black,
  );

  static final IconButtonThemeData _darkIconTheme = IconButtonThemeData(
      style: IconButton.styleFrom(
    backgroundColor: AppColor.white,
  ));

  static final IconButtonThemeData _lightIconTheme = IconButtonThemeData(
      style: IconButton.styleFrom(
    backgroundColor: AppColor.white,
  ));

  /// Button theme data
  static final ButtonThemeData _lightButtonThemeData = ButtonThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColor.black,
    ),
    disabledColor: Colors.grey.shade300,
  );

  /// Light text theme
  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightHeadline1,
    displayMedium: _lightHeadline2,
    displaySmall: _lightHeadline3,
    headlineMedium: _lightHeadline4,
    titleMedium: _lightSubtitle1,
    titleSmall: _lightSubtitle2,
    bodyMedium: _lightBodyText2,
    bodyLarge: _lightBodyText1,
    labelLarge: _lightButtonText,
    bodySmall: _lightCaptionText,
  );

  /// Light Theme Headline 1
  static const _lightHeadline1 = TextStyle(
    fontSize: 34,
    color: AppColor.black,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Headline 2
  static const _lightHeadline2 = TextStyle(
    fontSize: 24,
    color: AppColor.black,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Headline 3
  static const _lightHeadline3 = TextStyle(
    fontSize: 20,
    color: AppColor.black,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Headline 4
  static const _lightHeadline4 = TextStyle(
    fontSize: 18,
    color: AppColor.black,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Subtitle 1
  static const _lightSubtitle1 = TextStyle(
    fontSize: 16,
    color: AppColor.black,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Subtitle 2
  static const _lightSubtitle2 = TextStyle(
    fontSize: 15,
    color: AppColor.black,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Body Text 1
  static const _lightBodyText1 = TextStyle(
    fontSize: 13,
    color: AppColor.black,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Body Text 2
  static const _lightBodyText2 = TextStyle(
    fontSize: 12,
    color: AppColor.black,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Button Text
  static const _lightButtonText = TextStyle(
    fontSize: 14,
    color: AppColor.white,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Caption Button Text
  static const _lightCaptionText = TextStyle(
    fontSize: 10,
    color: AppColor.black,
    fontStyle: FontStyle.normal,
  );

  /// Dark theme data
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    appBarTheme: const AppBarTheme(elevation: 0),
    colorScheme: const ColorScheme.light(
      primary: AppColor.white,
      onPrimary: AppColor.white,
      primaryContainer: AppColor.white,
      secondary: AppColor.white,
      onSecondary: AppColor.black,
    ),
    scaffoldBackgroundColor: AppColor.black,
    buttonTheme: _darkButtonThemeData,
    iconButtonTheme: _darkIconTheme,
    textTheme: _darkTextTheme,
    cardTheme: _darkCardTheme,
  );

  /// Light text theme
  static const TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkHeadline1,
    displayMedium: _darkHeadline2,
    displaySmall: _darkHeadline3,
    headlineMedium: _darkHeadline4,
    titleMedium: _darkSubtitle1,
    titleSmall: _darkSubtitle2,
    bodyMedium: _darkBodyText2,
    bodyLarge: _darkBodyText1,
    labelLarge: _darkButtonText,
    bodySmall: _darkCaptionText,
  );

  /// Dark Theme Headline 1
  static const _darkHeadline1 = TextStyle(
    fontSize: 34,
    color: AppColor.white,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Headline 2
  static const _darkHeadline2 = TextStyle(
    fontSize: 24,
    color: AppColor.white,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Headline 3
  static const _darkHeadline3 = TextStyle(
    fontSize: 20,
    color: AppColor.white,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Headline 4
  static const _darkHeadline4 = TextStyle(
    fontSize: 18,
    color: AppColor.white,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Subtitle 1
  static const _darkSubtitle1 = TextStyle(
    fontSize: 16,
    color: AppColor.white,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Subtitle 2
  static const _darkSubtitle2 = TextStyle(
    fontSize: 15,
    color: AppColor.white,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Body Text 1
  static const _darkBodyText1 = TextStyle(
    fontSize: 13,
    color: AppColor.white,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Body Text 2
  static const _darkBodyText2 = TextStyle(
    fontSize: 12,
    color: AppColor.white,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Button Text
  static const _darkButtonText = TextStyle(
    fontSize: 14,
    color: AppColor.white,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Caption Button Text
  static const _darkCaptionText = TextStyle(
    fontSize: 10,
    color: AppColor.white,
    fontStyle: FontStyle.normal,
  );
}
