import 'package:flutter/material.dart';
import 'package:mobile_app/data/fake_data.dart';
import 'package:mobile_app/widgets/request_tile.dart';
import 'package:mobile_app/data/requests_store.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/routers/app_routes.dart';

class PatientDetailsScreen extends StatelessWidget {
  final String patientId;

  const PatientDetailsScreen({super.key, required this.patientId});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // دوّر على المريض بالـ id
    final patient = FakeData.patients.firstWhere((p) => p.id == patientId);

    // طلبات المريض ده بس، الأحدث الأول
    final requests = RequestsStore.instance.forPatient(patientId);

    return Scaffold(
      appBar: AppBar(title: Text(patient.name)),
      body: ListView(
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
          Center(child: Text('${patient.age} years', style: textTheme.bodyMedium)),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Notes', style: textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(patient.notes),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Activity log', style: textTheme.titleMedium),
          const SizedBox(height: 8),
          if (requests.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: Text('No activity yet')),
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
      ),
    );
  }
}