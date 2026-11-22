import 'package:flutter/material.dart';
import 'package:mobile_app/data/requests_store.dart';
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
    if (d.inMinutes < 1) return 'Less than a minute';
    if (d.inHours < 1) return '${d.inMinutes} min';
    return '${d.inHours} h ${d.inMinutes % 60} min';
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
          appBar: AppBar(title: const Text('Request details')),
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
                      title: const Text('Patient'),
                      subtitle: Text(store.patientNameOf(request.patientId)),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.schedule),
                      title: const Text('Requested'),
                      subtitle: Text(_formatDateTime(request.requestedAt)),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.check_circle_outline),
                      title: const Text('Executed'),
                      subtitle: Text(
                        executedAt == null
                            ? 'Not yet'
                            : _formatDateTime(executedAt),
                      ),
                    ),
                    if (executedAt != null) ...[
                      const Divider(height: 1),
                      ListTile(
                        leading: const Icon(Icons.timer_outlined),
                        title: const Text('Response time'),
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
                  label: const Text('Mark as done'),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}