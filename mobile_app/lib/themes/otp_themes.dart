import 'package:flutter/material.dart';

class OtpTheme extends ThemeExtension<OtpTheme> {
  final Color fillColor;
  final Color borderColor;
  final Color selectedColor;
  final Color textColor;
  final Color errorColor;

  const OtpTheme({
    required this.fillColor,
    required this.borderColor,
    required this.selectedColor,
    required this.textColor,
    required this.errorColor,
  });

  @override
  OtpTheme copyWith({
    Color? fillColor,
    Color? borderColor,
    Color? selectedColor,
    Color? textColor,
    Color? errorColor,
  }) {
    return OtpTheme(
      fillColor: fillColor ?? this.fillColor,
      borderColor: borderColor ?? this.borderColor,
      selectedColor: selectedColor ?? this.selectedColor,
      textColor: textColor ?? this.textColor,
      errorColor: errorColor ?? this.errorColor,
    );
  }

  @override
  OtpTheme lerp(ThemeExtension<OtpTheme>? other, double t) {
    if (other is! OtpTheme) return this;

    return OtpTheme(
      fillColor: Color.lerp(fillColor, other.fillColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      selectedColor: Color.lerp(selectedColor, other.selectedColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
    );
  }
}
