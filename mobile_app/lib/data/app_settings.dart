import 'package:flutter/material.dart';

class AppSettings {
  // أي حد يغيّر القيمة دي، التطبيق كله بيتحدث
  static final ValueNotifier<ThemeMode> themeMode =
  ValueNotifier(ThemeMode.dark);
}