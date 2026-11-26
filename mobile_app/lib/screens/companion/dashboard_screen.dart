import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/data/fake_data.dart';
import 'package:mobile_app/data/requests_store.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/widgets/patient_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = FakeData.patients
        .where((p) => p.name.toLowerCase().contains(_query.trim().toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.companion_navPatients.tr(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          TextField(
            onChanged: (value) => setState(() => _query = value),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: LocaleKeys.companion_searchPatients.tr(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: filtered.isEmpty
                ? Center(child: Text(LocaleKeys.companion_noPatients.tr()))
                : ListenableBuilder(
              listenable: RequestsStore.instance,
              builder: (context, _) => GridView.builder(
                itemCount: filtered.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final patient = filtered[index];
                  return PatientCard(
                    patient: patient,
                    pendingCount: RequestsStore.instance
                        .pendingCountFor(patient.id),
                    onTap: () => context.pushNamed(
                      AppRoutes.patientDetails,
                      pathParameters: {'id': patient.id},
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}