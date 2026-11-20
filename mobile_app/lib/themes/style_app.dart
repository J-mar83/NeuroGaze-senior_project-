
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/themes/fonts_app.dart';

class StyleApp {
  // Text Styles
  static TextStyle largeText = TextStyle(
    fontSize: 16.sp,
    fontFamily: FontsApp.mainFontFrame,
    fontWeight: FontWeight.bold,
  );

  static TextStyle mediumText = TextStyle(
    fontSize: 12.sp,
    fontFamily: FontsApp.mainFontFrame,
    fontWeight: FontWeight.w600,
  );

  static TextStyle smallText= TextStyle(
    fontSize: 9.sp,
    fontFamily: FontsApp.mainFontFrame,
    fontWeight: FontWeight.w300,
  );

  static TextStyle textButton = TextStyle(
    fontSize: 10.sp,
    fontFamily: FontsApp.mainFontFrame,
    fontWeight: FontWeight.bold,
  );

  // Border Radius
  static BorderRadius cardRadius = BorderRadius.circular(28.r);
  static BorderRadius inputRadius = BorderRadius.circular(18.r);

  // Border Width
  static double cardBorderWidth = 1.5.w;
  static double inputBorderWidth = 1.w;

  // Input Borders
  static OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: inputRadius,
    borderSide: BorderSide.none,
  );

  static OutlineInputBorder focusedInputBorder = OutlineInputBorder(
    borderRadius: inputRadius,
    borderSide: BorderSide(width: inputBorderWidth),
  );

  static OutlineInputBorder errorInputBorder = OutlineInputBorder(
    borderRadius: inputRadius,
    borderSide: BorderSide(width: inputBorderWidth),
  );
  
  // Padding
  static EdgeInsets inputPadding = EdgeInsets.symmetric(
    vertical: 5.h,
    horizontal: 10.w,
  );

  static EdgeInsets pagePadding = EdgeInsets.symmetric(
    vertical: 15.h,
    horizontal: 10.w,
  );
}

   
