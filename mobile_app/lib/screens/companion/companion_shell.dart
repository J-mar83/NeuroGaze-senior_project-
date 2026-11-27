import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/data/requests_store.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/screens/Companion/activity_screen.dart';
import 'package:mobile_app/screens/Companion/dashboard_screen.dart';
import 'package:mobile_app/screens/Companion/history_screen.dart';
import 'package:mobile_app/screens/Companion/settings_screen.dart';
import 'package:mobile_app/utils/orientation_aware.dart';

class CompanionShell extends StatefulWidget {
  const CompanionShell({super.key});

  @override
  State<CompanionShell> createState() => _CompanionShellState();
}

class _CompanionShellState extends State<CompanionShell> with OrientationAware {
  @override
  ScreenOrientation get orientation => ScreenOrientation.portrait;

  int _currentIndex = 0;

  final List<Widget> _pages = const [
    DashboardScreen(),
    ActivityScreen(),
    HistoryScreen(),
    SettingsScreen(),
  ];

  // أيقونة Activity مع رقم الطلبات المعلقة
  Widget _activityIcon(IconData icon) {
    return ListenableBuilder(
      listenable: RequestsStore.instance,
      builder: (context, _) {
        final count = RequestsStore.instance.pending.length;
        return Badge(
          isLabelVisible: count > 0,
          label: Text('$count'),
          child: Icon(icon),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          // لما اللغة تتغير، الـ key بيتغير فالتابات كلها بتتبني من جديد بالنصوص الجديدة
          key: ValueKey(context.locale.languageCode),
          index: _currentIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.people_outline),
            selectedIcon: const Icon(Icons.people),
            label: LocaleKeys.companion_navPatients.tr(),
          ),
          NavigationDestination(
            icon: _activityIcon(Icons.notifications_none),
            selectedIcon: _activityIcon(Icons.notifications),
            label: LocaleKeys.companion_navActivity.tr(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.history),
            selectedIcon: const Icon(Icons.history),
            label: LocaleKeys.companion_navHistory.tr(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: LocaleKeys.companion_navSettings.tr(),
          ),
        ],
      ),
    );
  }
}