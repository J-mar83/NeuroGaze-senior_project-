import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/data/requests_store.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/widgets/request_tile.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = RequestsStore.instance;

    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        final pending = store.pending;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.companion_navActivity.tr(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 4),
              Text(LocaleKeys.companion_pendingCount
                  .tr(args: ['${pending.length}'])),
              const SizedBox(height: 12),
              Expanded(
                child: pending.isEmpty
                    ? Center(child: Text(LocaleKeys.companion_allCaughtUp.tr()))
                    : ListView.builder(
                  itemCount: pending.length,
                  itemBuilder: (context, index) {
                    final request = pending[index];
                    return RequestTile(
                      request: request,
                      patientName: store.patientNameOf(request.patientId),
                      trailing: IconButton(
                        icon: const Icon(Icons.check_circle_outline),
                        color: Colors.green,
                        iconSize: 32,
                        onPressed: () => store.markDone(request.id),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}