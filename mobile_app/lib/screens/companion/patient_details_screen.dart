import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/data/fake_data.dart';
import 'package:mobile_app/data/requests_store.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/widgets/request_tile.dart';

class PatientDetailsScreen extends StatelessWidget {
  final String patientId;

  const PatientDetailsScreen({super.key, required this.patientId});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final patient = FakeData.patients.firstWhere((p) => p.id == patientId);

    return Scaffold(
      appBar: AppBar(title: Text(patient.name)),
      body: ListenableBuilder(
        listenable: RequestsStore.instance,
        builder: (context, _) {
          final requests = RequestsStore.instance.forPatient(patientId);

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Center(
                child: CircleAvatar(
                  radius: 40,
                  child: Text(patient.name[0], style: textTheme.headlineMedium),
                ),
              ),
              const SizedBox(height: 12),
              Center(child: Text(patient.name, style: textTheme.titleLarge)),
              Center(
                child: Text(
                  LocaleKeys.companion_yearsOld.tr(args: ['${patient.age}']),
                  style: textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LocaleKeys.companion_notes.tr(),
                          style: textTheme.titleMedium),
                      const SizedBox(height: 8),
                      Text(patient.notes),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(LocaleKeys.companion_activityLog.tr(),
                  style: textTheme.titleMedium),
              const SizedBox(height: 8),
              if (requests.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: Text(LocaleKeys.companion_noActivityYet.tr()),
                  ),
                )
              else
                ...requests.map(
                      (r) => RequestTile(
                    request: r,
                    onTap: () => context.pushNamed(
                      AppRoutes.requestDetails,
                      pathParameters: {'id': r.id},
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}