import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_app/models/command_request.dart';

class Command {
  final String id;
  final CommandType category; // needs / care / comfort / talk
  final String iconKey; // مفتاح الأيقونة (بنحوله لأيقونة في command_icons.dart)
  final String? titleKey; // مفتاح الترجمة (للأوامر الجاهزة)
  final String? customTitle; // نص كتبه المرافق (للأوامر المخصصة)
  final bool enabled; // المرافق ممكن يخفيه

  const Command({
    required this.id,
    required this.category,
    required this.iconKey,
    this.titleKey,
    this.customTitle,
    this.enabled = true,
  }) : assert(titleKey != null || customTitle != null);

  /// النص اللي بيظهر دلوقتي، بلغة التطبيق الحالية
  String get title => customTitle ?? titleKey!.tr();
}