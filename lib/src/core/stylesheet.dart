import 'package:flutter/material.dart';

abstract class StyleSheet {
  static AppTypography typography = AppTypography();
  static AppColors colors = AppColors();
  static AppGradients gradients = AppGradients();
}

class AppTypography {
  TextStyle get homeTitle => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 32,
        fontWeight: FontWeight.bold,
      );

  TextStyle get buttonTitle => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  TextStyle get paragraph => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.normal,
      );

  TextStyle get placeholder => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );

  TextStyle get bottomBarItem => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.normal,
      );
}

class AppColors {
  Color get brandBackground => Color(0xFF151515);

  Color get brandWhite => Color(0xFFFFFFFF);

  Color get gradientButtonLeft => Color(0xFFEF5F53);

  Color get gradientButtonRight => Color(0xFFFA8F70);

  Color get gradientBlueTop => Color(0xFF5935FF);

  Color get gradientBlueBottom => Color(0xFF47408E);

  Color get gradientPinkTop => Color(0xFFFF6CD9);

  Color get gradientPinkBottom => Color(0xFFFF2184);

  Color get gradientCyanTop => Color(0xFF01D4E4);

  Color get gradientCyanBottom => Color(0xFF009DE0);

  Color get gradientYellowTop => Color(0xFFF9C270);

  Color get gradientYellowBottom => Color(0xFFFFAA2B);
}

class AppGradients {
  LinearGradient get button => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: <Color>[
          StyleSheet.colors.gradientButtonLeft,
          StyleSheet.colors.gradientButtonRight,
        ],
      );

  LinearGradient get blue => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          StyleSheet.colors.gradientBlueTop,
          StyleSheet.colors.gradientBlueBottom,
        ],
      );

  LinearGradient get pink => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          StyleSheet.colors.gradientPinkTop,
          StyleSheet.colors.gradientPinkBottom,
        ],
      );

  LinearGradient get cyan => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          StyleSheet.colors.gradientCyanTop,
          StyleSheet.colors.gradientCyanBottom,
        ],
      );

  LinearGradient get yellow => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          StyleSheet.colors.gradientYellowTop,
          StyleSheet.colors.gradientYellowBottom,
        ],
      );
}
