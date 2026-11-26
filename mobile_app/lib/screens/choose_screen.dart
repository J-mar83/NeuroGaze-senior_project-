
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/themes/assets_app.dart';
import 'package:mobile_app/themes/style_app.dart';
import 'package:mobile_app/widgets/card_widget.dart';
import 'package:mobile_app/widgets/spacing_widget.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: StyleApp.pagePadding,
          child: Row(
            children: [
              Expanded(
                child: CardCommand(
                  title: LocaleKeys.chooseScreen_patient.tr(),
                  iconCommand: AssetsApp.patient,
                  iconSize: size.height * 0.28,
                  onTap: () => context.pushNamed(AppRoutes.loginScreen),
                ).animate()
                 .fadeIn(duration: 600.ms, curve: Curves.easeOutCubic)
                 .slideY(begin: 0.15, end: 0, duration: 600.ms),
              ),

              const WidthSpacing(width: 20,),

              Expanded(
                child: CardCommand(
                  title: LocaleKeys.chooseScreen_companion.tr(),
                  iconCommand: AssetsApp.companion,
                  iconSize: size.height * 0.28,
                  onTap: () => context.pushNamed('companion'),
                ).animate(delay: 250.ms) 
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

