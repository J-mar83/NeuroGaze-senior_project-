import 'package:flutter/material.dart';
import 'package:mobile_app/models/patient.dart';
import 'package:mobile_app/themes/colors_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;
  final int pendingCount; // عدد الطلبات اللي لسه ما اتنفذتش
  final VoidCallback onTap;

  const PatientCard({
    super.key,
    required this.patient,
    required this.pendingCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(radius: 24, child: Text(patient.name[0])),
                  if (pendingCount > 0)
                    Badge(
                      label: Text('$pendingCount'),
                      backgroundColor: AppColors.emergency,
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                patient.name,
                style: textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                LocaleKeys.companion_yearsOld.tr(args: ['${patient.age}']),
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                patient.notes,
                style: textTheme.bodySmall,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}