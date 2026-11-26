import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/models/command_request.dart';
import 'package:mobile_app/models/command_type_ext.dart';
import 'package:mobile_app/themes/colors_app.dart';

class RequestTile extends StatelessWidget {
  final CommandRequest request;
  final String? patientName; // بيظهر في Activity/History بس
  final Widget? trailing; // بدل علامة الحالة (مثلاً زرار ✔)
  final VoidCallback? onTap;

  const RequestTile({
    super.key,
    required this.request,
    this.patientName,
    this.trailing,
    this.onTap,
  });

  String _formatTime(DateTime t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '${t.day}/${t.month} $h:$m';
  }

  String _subtitle() {
    final parts = <String>[];
    if (patientName != null) parts.add(patientName!);
    parts.add(LocaleKeys.companion_requestedAt
        .tr(args: [_formatTime(request.requestedAt)]));
    if (request.executedAt != null) {
      parts.add(LocaleKeys.companion_doneAt
          .tr(args: [_formatTime(request.executedAt!)]));
    }
    return parts.join(' • ');
  }

  @override
  Widget build(BuildContext context) {
    final isEmergency = request.type == CommandType.emergency;
    final color = isEmergency ? AppColors.emergency : AppColors.primaryColor;

    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(request.type.icon, color: color),
        ),
        title: Text(request.title),
        subtitle: Text(_subtitle()),
        trailing: trailing ??
            Text(
              request.isDone
                  ? LocaleKeys.companion_done.tr()
                  : LocaleKeys.companion_pending.tr(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: request.isDone ? Colors.green : Colors.orange,
              ),
            ),
      ),
    );
  }
}