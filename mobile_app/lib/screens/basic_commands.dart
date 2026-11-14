import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/widgets/card_of_command.dart';

class BasicCommands extends StatelessWidget {
  const BasicCommands({super.key});

  // مكان واحد لتعديل الكروت: العنوان، الأيقونة، الروت
  static const _commands = <({String title, String icon, String route})>[
    (title: 'Needs',   icon: 'assets/images/needs.png', route: AppRoutes.loginScreen),
    (title: 'Care',    icon: 'assets/images/patient.png', route: AppRoutes.loginScreen),
    (title: 'Comfort', icon: 'assets/images/patient.png', route: AppRoutes.loginScreen),
    (title: 'Talk',    icon: 'assets/images/patient.png', route: AppRoutes.loginScreen),
  ];

  @override
  Widget build(BuildContext context) {
    const space = 10.0;
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
            vertical: size.height * 0.04,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/Glossy_Logo.png',
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    'look at a card to open it',
                    style: theme.textTheme.labelMedium,
                  ),
                ],
              ).animate().fadeIn(duration: 500.ms),

              const SizedBox(height: space),

              Expanded(
                child: Row(
                  children: [
                    for (var i = 0; i < _commands.length; i++) ...[
                      if (i != 0) const SizedBox(width: space),
                      Expanded(
                        child: CardCommand(
                          title: _commands[i].title,
                          iconCommand: _commands[i].icon,
                          iconSize: size.height * 0.2,
                          onTap: () => context.pushNamed(_commands[i].route),
                        )
                            .animate(delay: (80 * i).ms)
                            .fadeIn(duration: 600.ms, curve: Curves.easeOutCubic)
                            .slideY(begin: 0.15, end: 0, duration: 600.ms),
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: space),

              // زرار الطوارئ
              SizedBox(
                width: double.infinity,
                height: size.height * 0.10,
                child: TextButton.icon(      
                  onPressed: () => context.pushNamed(AppRoutes.loginScreen),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFB75151),
                  ),
                  icon: const Icon(
                    Icons.warning_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                  label: Text('Emergency', style: theme.textTheme.labelMedium),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}