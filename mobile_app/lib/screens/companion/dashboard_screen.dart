import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/data/fake_data.dart';
import 'package:mobile_app/data/requests_store.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/widgets/patient_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _query = ''; // اللي المستخدم كتبه في البحث

  @override
  Widget build(BuildContext context) {
    // فلترة المرضى حسب الاسم
    final filtered = FakeData.patients
        .where((p) => p.name.toLowerCase().contains(_query.trim().toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Patients', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          TextField(
            onChanged: (value) => setState(() => _query = value),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search patients',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('No patients found'))
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