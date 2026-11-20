import 'package:flutter/material.dart';
import 'package:mobile_app/themes/colors_app.dart';
import 'package:mobile_app/themes/fonts_app.dart';
import 'package:mobile_app/themes/style_app.dart';

// themes for light
class LightThemes {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      outline: AppColors.bordercontainercolorLight,
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundcolorLight,
    fontFamily: FontsApp.mainFontFrame,

    textTheme: TextTheme(
      titleLarge: StyleApp.largeText.copyWith(color: AppColors.textcolorLight),
      labelMedium: StyleApp.mediumText.copyWith(
        color: AppColors.textcolorLight,
      ),
      bodySmall: StyleApp.smallText.copyWith(color: AppColors.textcolorLight),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttoncolorLight,
        foregroundColor: AppColors.textcolorLight,
        textStyle: StyleApp.textButton,
        shape: RoundedRectangleBorder(
          borderRadius: StyleApp.cardRadius,
        ),
      ),
    ),

    cardTheme: CardThemeData(
      color: AppColors.containercolorLight,
      shape: RoundedRectangleBorder(
        borderRadius: StyleApp.cardRadius,
        side: BorderSide(
          color: AppColors.bordercontainercolorLight,
          width: StyleApp.cardBorderWidth,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: StyleApp.smallText.copyWith(color: AppColors.textcolorLight),
      hintStyle: StyleApp.smallText.copyWith(color: AppColors.primaryColor),
      filled: true,
      fillColor: AppColors.containercolorLight,
      border: StyleApp.inputBorder,

      focusedBorder: StyleApp.focusedInputBorder.copyWith(
        borderSide: BorderSide(
          color: AppColors.buttoncolorLight,
          width: StyleApp.inputBorderWidth,
        ),
      ),

      errorBorder: StyleApp.errorInputBorder.copyWith(
        borderSide: BorderSide(
          color: AppColors.emergency,
          width: StyleApp.inputBorderWidth,
        ),
      ),

      contentPadding: StyleApp.inputPadding,
    ),
  );
}

//  themes for dark
class DarkThemes {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      outline: AppColors.bordercontainercolorDark,
      seedColor: AppColors.primaryColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundcolorDark,
    fontFamily: FontsApp.mainFontFrame,

    textTheme: TextTheme(
      titleLarge: StyleApp.largeText.copyWith(color: AppColors.textcolorDark),
      labelMedium: StyleApp.mediumText.copyWith(
        color: AppColors.textcolorDark,
      ),
      bodySmall: StyleApp.smallText.copyWith(color: AppColors.textcolorDark),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttoncolorDark,
        foregroundColor: AppColors.textcolorDark,
        textStyle: StyleApp.textButton,
        shape: RoundedRectangleBorder(
          borderRadius: StyleApp.cardRadius,
        ),
      ),
    ),

    cardTheme: CardThemeData(
      color: AppColors.containercolorDark,
      shape: RoundedRectangleBorder(
        borderRadius: StyleApp.cardRadius,
        side: BorderSide(
          color: AppColors.bordercontainercolorDark,
          width: StyleApp.cardBorderWidth,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: StyleApp.smallText.copyWith(color: AppColors.textcolorDark),
      hintStyle: StyleApp.smallText.copyWith(color: AppColors.primaryColor),
      filled: true,
      fillColor: AppColors.containercolorDark,

      border: StyleApp.inputBorder,

      focusedBorder: StyleApp.focusedInputBorder.copyWith(
        borderSide: BorderSide(
          color: AppColors.buttoncolorDark,
          width: StyleApp.inputBorderWidth,
        ),
      ),

      errorBorder: StyleApp.errorInputBorder.copyWith(
        borderSide: BorderSide(
          color: AppColors.emergency,
          width: StyleApp.inputBorderWidth,
        ),
      ),

      contentPadding: StyleApp.inputPadding,
    ),
  );
}