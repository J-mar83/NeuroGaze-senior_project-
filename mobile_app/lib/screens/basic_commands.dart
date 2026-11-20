import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/themes/assets_app.dart';
import 'package:mobile_app/themes/style_app.dart';
import 'package:mobile_app/widgets/card_of_command.dart';
import 'package:mobile_app/widgets/spacing_widget.dart';

class BasicCommands extends StatelessWidget {
  const BasicCommands({super.key});

  // مكان واحد لتعديل الكروت: العنوان، الأيقونة، الروت
  static final _commands = <({String title, String icon, String route})>[
    (title: LocaleKeys.basicCommandsScreen_needsCommand.tr(), icon:AssetsApp.needs, route: AppRoutes.loginScreen),
    (title: LocaleKeys.basicCommandsScreen_careCommand.tr(), icon:AssetsApp.care, route: AppRoutes.loginScreen),
    (title: LocaleKeys.basicCommandsScreen_comfortCommand.tr(), icon:AssetsApp.comfort, route: AppRoutes.loginScreen),
    (title: LocaleKeys.basicCommandsScreen_talkCommand.tr(),    icon: AssetsApp.talk, route: AppRoutes.loginScreen),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
           padding: StyleApp.pagePadding,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetsApp.logo,
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    LocaleKeys.basicCommandsScreen_titleOfPage.tr(),
                    style: theme.textTheme.labelMedium,
                  ),
                ],
              ).animate(delay: 1.seconds)
              .fadeIn(duration: 600.ms, curve: Curves.easeOutCubic)
              .slideX(begin: 0.15, end: 0, duration: 600.ms),

              const HeigthSpacing(heigth: 10),

              Expanded(
                child: Row(
                  children: [
                    for (var i = 0; i < _commands.length; i++) ...[
                      if (i != 0) const HeigthSpacing(heigth: 10),
                      Expanded(
                        child: CardCommand(
                          title: _commands[i].title,
                          iconCommand: _commands[i].icon,
                          iconSize: size.height * 0.2,
                          onTap: () => context.pushNamed(_commands[i].route),
                        )
                            .animate(delay: (250 * i).ms)
                            .fadeIn(duration: 600.ms, curve: Curves.easeOutCubic)
                            .slideY(begin: 0.15, end: 0, duration: 600.ms),
                      ),
                    ],
                  ],
                ),
              ),

              const  HeigthSpacing(heigth: 10),
              // زرار الطوارئ
              SizedBox(
                width: double.infinity,
                height: size.height * 0.10,
                child: TextButton.icon(      
                  onPressed: () => context.pushNamed(AppRoutes.loginScreen),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFB75151),
                  ),
                  icon: Icon(
                    Icons.warning_rounded,
                    color: Colors.white,
                    size: 13.sp,
                  ),
                  label: Text(LocaleKeys.basicCommandsScreen_emergencyCommand.tr(), style: theme.textTheme.bodySmall),
                ),

              ).animate(delay: 1.2.seconds)
              .fadeIn(duration: 600.ms, curve: Curves.easeOutCubic)
              .slideX(begin: 0.15, end: 0, duration: 600.ms),
            ],
          ),
        ),
      ),
    );
  }
}