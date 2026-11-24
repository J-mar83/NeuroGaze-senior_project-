import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/models/user_role.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/themes/assets_app.dart';
import 'package:mobile_app/themes/style_app.dart';
import 'package:mobile_app/utils/orientation_aware.dart';
import 'package:mobile_app/widgets/card_of_command.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> with OrientationAware {
  @override
  ScreenOrientation get orientation => ScreenOrientation.portrait;

  // كارت بارتفاع محدد بالأرقام (مش بيعتمد على Expanded/Spacer)
  Widget _roleCard({
    required String title,
    required String icon,
    required UserRole role,
    required Duration delay,
    required double height,
  }) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: CardCommand(
        gaze: false,
        title: title,
        iconCommand: icon,
        iconSize: height * 0.55,
        onTap: () => context.pushNamed(AppRoutes.loginScreen, extra: role),
      )
          .animate(delay: delay)
          .fadeIn(duration: 600.ms, curve: Curves.easeOutCubic)
          .slideY(begin: 0.15, end: 0, duration: 600.ms),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // كل كارت 36% من ارتفاع الشاشة المتاحة. غيّر الرقم لو عايز أكبر/أصغر
            final cardHeight = constraints.maxHeight * 0.36;

            return Center(
              child: Padding(
                padding: StyleApp.pagePadding,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // الـ Column بياخد حجم الكارتين بس
                  children: [
                    _roleCard(
                      title: LocaleKeys.chooseScreen_patient.tr(),
                      icon: AssetsApp.patient,
                      role: UserRole.patient,
                      delay: Duration.zero,
                      height: cardHeight,
                    ),
                    const SizedBox(height: 24),
                    _roleCard(
                      title: LocaleKeys.chooseScreen_companion.tr(),
                      icon: AssetsApp.companion,
                      role: UserRole.companion,
                      delay: 250.ms,
                      height: cardHeight,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}