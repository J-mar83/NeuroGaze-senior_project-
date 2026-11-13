import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_colors.dart';

// themes for light
class LightThemes {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundcolorLight,

    textTheme: const TextTheme(
      bodySmall: TextStyle(color: AppColors.textcolorLight, fontSize: 12),
      titleLarge: TextStyle(
        color: AppColors.textcolorLight,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(color: AppColors.textcolorLight, fontSize: 16),
    ),
    
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttoncolorLight,
        foregroundColor: AppColors.textcolorLight,
        textStyle: const TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),

    cardTheme: CardThemeData(
      color: AppColors.containercolorLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle:TextStyle(color:AppColors.textcolorLight,fontSize: 12),
      filled: true,
      fillColor: AppColors.containercolorLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: AppColors.primaryColor, fontSize: 16),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.buttoncolorLight),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.emergency),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    ),
  );
}

//  themes for dark
class DarkThemes {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundcolorDark,

    textTheme: const TextTheme(
      bodySmall: TextStyle(color: AppColors.textcolorDark, fontSize: 12),
      titleLarge: TextStyle(
        color: AppColors.textcolorDark,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(color: AppColors.textcolorDark, fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttoncolorDark,
        foregroundColor: AppColors.textcolorDark,
        textStyle: const TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),

    cardTheme: CardThemeData(
      color: AppColors.containercolorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color:Colors.blueGrey,width:3),
      ),
      
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.containercolorDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: AppColors.primaryColor, fontSize: 16),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.buttoncolorDark),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.emergency),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    ),
  );
}
