import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/models/command_request.dart';

extension CommandTypeX on CommandType {
  String get label => switch (this) {
    CommandType.needs => LocaleKeys.basicCommandsScreen_needsCommand.tr(),
    CommandType.care => LocaleKeys.basicCommandsScreen_careCommand.tr(),
    CommandType.comfort => LocaleKeys.basicCommandsScreen_comfortCommand.tr(),
    CommandType.talk => LocaleKeys.basicCommandsScreen_talkCommand.tr(),
    CommandType.emergency => LocaleKeys.basicCommandsScreen_emergencyCommand.tr(),
  };

  IconData get icon => switch (this) {
    CommandType.needs => Icons.water_drop_outlined,
    CommandType.care => Icons.favorite_border,
    CommandType.comfort => Icons.bed_outlined,
    CommandType.talk => Icons.chat_bubble_outline,
    CommandType.emergency => Icons.warning_amber_rounded,
  };
}