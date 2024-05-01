import 'package:flutter/material.dart';
import '../core/app_export.dart';

String _appTheme = "primary";
PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.gray50,
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.green900,
          fontSize: 18.fSize,
          fontFamily: 'Inder',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 14.fSize,
          fontFamily: 'Inder',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.blueGray700,
          fontSize: 10.fSize,
          fontFamily: 'Inder',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.gray50,
          fontSize: 32.fSize,
          fontFamily: 'Inria Serif',
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: appTheme.green700,
          fontSize: 20.fSize,
          fontFamily: 'Inder',
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 16.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light();
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);
// BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray700 => Color(0XFF525252);
  Color get blueGray900 => Color(0XFF333333);
// Gray
  Color get gray50 => Color(0XFFF7FFF4);
  Color get gray5001 => Color(0XFFF7FFF3);
  Color get gray700 => Color(0XFF666666);
  Color get gray900 => Color(0XFF153C1B);
  Color get gray90001 => Color(0XFF082612);
// Green
  Color get green300 => Color(0XFF8BA77E);
  Color get green700 => Color(0XFF428C47);
  Color get green900 => Color(0XFF25592D);
// LightGreenf
  Color get lightGreen2007f => Color(0X7FB7D9A7);
// LightGreen
  Color get lightGreen900 => Color(0XFF37502B);
// White
  Color get whiteA700 => Color(0XFFFFFFFF);
}
