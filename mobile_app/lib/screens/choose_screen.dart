
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/routers/app_routes.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
            vertical: size.height * 0.08,
          ),
          child: Row(
            children: [
              Expanded(
                child: _RoleCard(
                  title: LocaleKeys.chooseScreen_patient.tr(),
                  imagePath: 'assets/images/patient.png',
                  iconSize: size.height * 0.28,
                  onTap: () => context.pushNamed(AppRoutes.loginScreen),
                )
                    .animate()
                    .fadeIn(duration: 600.ms, curve: Curves.easeOutCubic)
                    .slideY(begin: 0.15, end: 0, duration: 600.ms),
              ),
              SizedBox(width: size.width * 0.04),
              Expanded(
                child: _RoleCard(
                  title: LocaleKeys.chooseScreen_companion.tr(),
                  imagePath: 'assets/images/nurse.png',
                  iconSize: size.height * 0.28,
                  onTap: () => context.pushNamed('companion'),
                )
                    .animate(delay: 250.ms) 
                    .fadeIn(duration: 600.ms, curve: Curves.easeOutCubic)
                    .slideY(begin: 0.15, end: 0, duration: 600.ms),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.title,
    required this.imagePath,
    required this.iconSize,
    required this.onTap,
  });

  final String title;
  final String imagePath;
  final double iconSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: iconSize,
              height: iconSize,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 15),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}