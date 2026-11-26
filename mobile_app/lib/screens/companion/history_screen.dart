import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/data/requests_store.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/widgets/request_tile.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = RequestsStore.instance;

    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        final done = store.done;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.companion_navHistory.tr(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 4),
              Text(LocaleKeys.companion_completedCount
                  .tr(args: ['${done.length}'])),
              const SizedBox(height: 12),
              Expanded(
                child: done.isEmpty
                    ? Center(child: Text(LocaleKeys.companion_noHistoryYet.tr()))
                    : ListView.builder(
                  itemCount: done.length,
                  itemBuilder: (context, index) {
                    final request = done[index];
                    return RequestTile(
                      request: request,
                      patientName: store.patientNameOf(request.patientId),
                      onTap: () => context.pushNamed(
                        AppRoutes.requestDetails,
                        pathParameters: {'id': request.id},
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