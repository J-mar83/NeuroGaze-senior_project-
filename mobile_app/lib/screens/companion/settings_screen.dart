import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/data/app_settings.dart';
import 'package:mobile_app/data/fake_data.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/themes/colors_app.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> _confirmLogout(BuildContext context) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(LocaleKeys.companion_logoutQuestion.tr()),
        content: Text(LocaleKeys.companion_logoutMessage.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(LocaleKeys.companion_cancel.tr()),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(LocaleKeys.companion_logout.tr()),
          ),
        ],
      ),
    );

    if (ok == true && context.mounted) {
      context.goNamed(AppRoutes.chooseScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          LocaleKeys.companion_navSettings.tr(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(child: Text(FakeData.companionName[0])),
                title: Text(FakeData.companionName),
                subtitle: Text(LocaleKeys.companion_role.tr()),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.email_outlined),
                title: Text(LocaleKeys.companion_email.tr()),
                subtitle: Text(FakeData.companionEmail),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(LocaleKeys.companion_emergencyNumber.tr()),
                subtitle: Text(FakeData.companionEmergency),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Column(
            children: [
              ValueListenableBuilder<ThemeMode>(
                valueListenable: AppSettings.themeMode,
                builder: (context, mode, _) => SwitchListTile(
                  secondary: const Icon(Icons.dark_mode_outlined),
                  title: Text(LocaleKeys.companion_darkMode.tr()),
                  value: mode == ThemeMode.dark,
                  onChanged: (isDark) {
                    AppSettings.themeMode.value =
                    isDark ? ThemeMode.dark : ThemeMode.light;
                  },
                ),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.language),
                title: Text(LocaleKeys.companion_language.tr()),
                trailing: SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'en', label: Text('EN')),
                    ButtonSegment(value: 'ar', label: Text('AR')),
                  ],
                  selected: {context.locale.languageCode},
                  onSelectionChanged: (selection) {
                    context.setLocale(Locale(selection.first));
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        OutlinedButton.icon(
          onPressed: () => _confirmLogout(context),
          icon: const Icon(Icons.logout),
          label: Text(LocaleKeys.companion_logout.tr()),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.emergency,
            side: const BorderSide(color: AppColors.emergency),
          ),
        ),
      ],
    );
  }
}