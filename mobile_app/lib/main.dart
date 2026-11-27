import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/routers/routers_generator.dart';
import 'package:mobile_app/themes/light_dark_themes.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/data/app_settings.dart';
import 'package:mobile_app/data/device_session.dart';
import 'package:mobile_app/models/user_role.dart';
import 'package:mobile_app/utils/orientation_aware.dart';

// Landscape بس لو الجهاز ده جهاز المريض. غير كده Portrait.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DeviceSession.load();
  await setAppOrientation(
    DeviceSession.role == UserRole.patient
        ? ScreenOrientation.landscape
        : ScreenOrientation.portrait,
  );
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // code not close the screen during open application
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WakelockPlus.enable();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      WakelockPlus.enable();
    } else if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      WakelockPlus.disable();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    WakelockPlus.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: AppSettings.themeMode,
          builder: (context, mode, _) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,

              theme: LightThemes.theme,
              darkTheme: DarkThemes.theme,
              themeMode: mode,

              routerConfig: RoutersGenerator.mainRoutingInOutApp,
            );
          },
        );
      },
    );
  }
}