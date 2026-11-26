
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_app/models/command_request.dart';

class Command {
  final String id;
  final CommandType category;
  final String iconKey;
  final String? titleKey;
  final String? customTitle;
  final bool enabled;
  final int order;

  const Command({
    required this.id,
    required this.category,
    required this.iconKey,
    this.titleKey,
    this.customTitle,
    this.enabled = true,
    this.order = 0,
  }) : assert(titleKey != null || customTitle != null);

  String get title => customTitle ?? titleKey!.tr();
}
