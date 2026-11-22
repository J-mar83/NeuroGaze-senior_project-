import 'package:flutter/material.dart';
import 'package:mobile_app/models/command_request.dart';

extension CommandTypeX on CommandType {
  String get label => switch (this) {
    CommandType.needs => 'Needs',
    CommandType.care => 'Care',
    CommandType.comfort => 'Comfort',
    CommandType.talk => 'Talk',
    CommandType.emergency => 'Emergency',
  };

  IconData get icon => switch (this) {
    CommandType.needs => Icons.water_drop_outlined,
    CommandType.care => Icons.favorite_border,
    CommandType.comfort => Icons.bed_outlined,
    CommandType.talk => Icons.chat_bubble_outline,
    CommandType.emergency => Icons.warning_amber_rounded,
  };
}