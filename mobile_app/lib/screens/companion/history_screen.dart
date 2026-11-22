import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/data/requests_store.dart';
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
              Text('History', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 4),
              Text('${done.length} completed'),
              const SizedBox(height: 12),
              Expanded(
                child: done.isEmpty
                    ? const Center(child: Text('No history yet'))
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