import 'package:flutter/material.dart';

// كل أيقونة ليها مفتاح نصي. ده هيخلي المرافق يختار أيقونة لأمر جديد،
// وبعدين الباك إند يخزن المفتاح بس.
const Map<String, IconData> _commandIcons = {
  'water': Icons.water_drop_outlined,
  'food': Icons.restaurant_outlined,
  'toilet': Icons.wc,
  'air': Icons.air,
  'medicine': Icons.medication_outlined,
  'pain': Icons.healing,
  'nurse': Icons.local_hospital_outlined,
  'doctor': Icons.medical_services_outlined,
  'pillow': Icons.bed_outlined,
  'blanket': Icons.king_bed_outlined,
  'light': Icons.lightbulb_outline,
  'temperature': Icons.thermostat,
  'yes': Icons.thumb_up_outlined,
  'no': Icons.thumb_down_outlined,
  'thanks': Icons.favorite_border,
  'family': Icons.family_restroom,
};

IconData commandIcon(String key) =>
    _commandIcons[key] ?? Icons.touch_app_outlined;