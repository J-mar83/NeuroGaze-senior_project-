import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/data/requests_store.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/models/command_request.dart';
import 'package:mobile_app/models/command_type_ext.dart';
import 'package:mobile_app/themes/colors_app.dart';

class RequestDetailsScreen extends StatelessWidget {
  final String requestId;

  const RequestDetailsScreen({super.key, required this.requestId});

  String _formatDateTime(DateTime t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '${t.day}/${t.month}/${t.year}  $h:$m';
  }

  String _formatDuration(Duration d) {
    if (d.inMinutes < 1) return LocaleKeys.companion_lessThanMinute.tr();
    if (d.inHours < 1) {
      return LocaleKeys.companion_minutes.tr(args: ['${d.inMinutes}']);
    }
    return LocaleKeys.companion_hoursMinutes
        .tr(args: ['${d.inHours}', '${d.inMinutes % 60}']);
  }

  @override
  Widget build(BuildContext context) {
    final store = RequestsStore.instance;
    final textTheme = Theme.of(context).textTheme;

    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        final request = store.requestById(requestId);
        final isEmergency = request.type == CommandType.emergency;
        final color = isEmergency ? AppColors.emergency : AppColors.primaryColor;
        final executedAt = request.executedAt;

        return Scaffold(
          appBar: AppBar(title: Text(LocaleKeys.companion_requestDetails.tr())),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: color.withValues(alpha: 0.15),
                  child: Icon(request.type.icon, size: 40, color: color),
                ),
              ),
              const SizedBox(height: 12),
              Center(child: Text(request.title, style: textTheme.titleLarge)),
              Center(child: Text(request.type.label, style: textTheme.bodyMedium)),
              const SizedBox(height: 16),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person_outline),
                      title: Text(LocaleKeys.companion_patient.tr()),
                      subtitle: Text(store.patientNameOf(request.patientId)),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.schedule),
                      title: Text(LocaleKeys.companion_requested.tr()),
                      subtitle: Text(_formatDateTime(request.requestedAt)),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.check_circle_outline),
                      title: Text(LocaleKeys.companion_executed.tr()),
                      subtitle: Text(
                        executedAt == null
                            ? LocaleKeys.companion_notYet.tr()
                            : _formatDateTime(executedAt),
                      ),
                    ),
                    if (executedAt != null) ...[
                      const Divider(height: 1),
                      ListTile(
                        leading: const Icon(Icons.timer_outlined),
                        title: Text(LocaleKeys.companion_responseTime.tr()),
                        subtitle: Text(
                          _formatDuration(
                            executedAt.difference(request.requestedAt),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (!request.isDone) ...[
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () => store.markDone(request.id),
                  icon: const Icon(Icons.check),
                  label: Text(LocaleKeys.companion_markAsDone.tr()),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}