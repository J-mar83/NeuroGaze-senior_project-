import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:go_router/go_router.dart';
import 'package:mobile_app/data/commands_store.dart';
import 'package:mobile_app/data/device_session.dart';
import 'package:mobile_app/data/requests_store.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/models/command.dart';
import 'package:mobile_app/models/command_icons.dart';
import 'package:mobile_app/models/command_request.dart';
import 'package:mobile_app/models/command_type_ext.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/themes/assets_app.dart';
import 'package:mobile_app/themes/style_app.dart';
import 'package:mobile_app/utils/orientation_aware.dart';
import 'package:mobile_app/widgets/gaze_button.dart';

class BasicCommands extends StatefulWidget {
  const BasicCommands({super.key});

  @override
  State<BasicCommands> createState() => _BasicCommandsState();
}

class _BasicCommandsState extends State<BasicCommands> with OrientationAware {
  @override
  ScreenOrientation get orientation => ScreenOrientation.landscape;

  CommandType? _category; // null = بنعرض الفئات
  int _page = 0;
  String? _sentTitle; // لو فيه قيمة: بنعرض رسالة "تم الإرسال"
  Timer? _resetTimer;
  int? _emergencyCountdown; // لو فيه قيمة: بنعرض عدّاد إلغاء الطوارئ
  Timer? _countdownTimer;

  @override
  void dispose() {
    _resetTimer?.cancel();
    _countdownTimer?.cancel();
    super.dispose();
  }

  // ---------- أفعال المريض ----------

  void _previous(int page, int pageCount) {
    if (_sentTitle != null) return;
    setState(() {
      if (page > 0) {
        _page = page - 1;
      } else if (_category != null) {
        _category = null; // من أول صفحة أوامر: رجوع للفئات
        _page = 0;
      } else {
        _page = pageCount - 1; // من أول صفحة فئات: لآخر صفحة
      }
    });
  }

  void _next(int page, int pageCount) {
    if (_sentTitle != null) return;
    setState(() => _page = (page + 1) % pageCount);
  }

  void _send(Command command) {
    RequestsStore.instance.addRequest(
      patientId: DeviceSession.patientId,
      type: command.category,
      title: command.title,
    );
    _showSent(command.title);
  }

  // الطوارئ: بعد التثبيت بنبدأ عدّاد، والمريض ممكن يلغي قبل ما يخلص
  void _startEmergencyCountdown() {
    if (_emergencyCountdown != null) return; // العدّاد شغال بالفعل
    _resetTimer?.cancel(); // لو كانت شاشة "تم الإرسال" ظاهرة
    _countdownTimer?.cancel();
    setState(() {
      _sentTitle = null;
      _emergencyCountdown =
          CommandsStore.instance.settings.effectiveCancelSeconds;
    });
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      final left = (_emergencyCountdown ?? 1) - 1;
      if (left <= 0) {
        timer.cancel();
        _confirmEmergency();
      } else {
        setState(() => _emergencyCountdown = left);
      }
    });
  }

  void _cancelEmergency() {
    _countdownTimer?.cancel();
    setState(() => _emergencyCountdown = null); // رجوع لنفس الشاشة
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(LocaleKeys.patientScreen_emergencyCancelled.tr()),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _confirmEmergency() {
    final title = LocaleKeys.basicCommandsScreen_emergencyCommand.tr();
    RequestsStore.instance.addRequest(
      patientId: DeviceSession.patientId,
      type: CommandType.emergency,
      title: title,
    );
    setState(() => _emergencyCountdown = null);
    _showSent(title);
  }

  // رسالة "تم الإرسال" ثانيتين تقريباً، وبعدها نرجع للفئات
  void _showSent(String title) {
    setState(() => _sentTitle = title);
    _resetTimer?.cancel();
    _resetTimer = Timer(const Duration(milliseconds: 1800), () {
      if (!mounted) return;
      setState(() {
        _sentTitle = null;
        _category = null;
        _page = 0;
      });
    });
  }

  // ---------- أجزاء الشاشة ----------

  String _categoryImage(CommandType type) => switch (type) {
    CommandType.needs => AssetsApp.needs,
    CommandType.care => AssetsApp.care,
    CommandType.comfort => AssetsApp.comfort,
    CommandType.talk => AssetsApp.talk,
    CommandType.emergency => AssetsApp.needs, // مش بيتعرض كفئة
  };

  Widget _card({
    required Widget visual,
    required String title,
    required Duration dwell,
    required VoidCallback onActivated,
  }) {
    return GazeButton(
      dwell: dwell,
      onActivated: onActivated,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: visual),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildSlot(
      int index,
      List<Command> commands,
      double iconSize,
      Duration dwell,
      ) {
    if (_category == null) {
      final category = CommandsStore.categories[index];
      return _card(
        visual: Image.asset(
          _categoryImage(category),
          height: iconSize,
          fit: BoxFit.contain,
        ),
        title: category.label,
        dwell: dwell,
        onActivated: () => setState(() {
          _category = category;
          _page = 0;
        }),
      );
    }

    final command = commands[index];
    return _card(
      visual: Icon(
        commandIcon(command.iconKey),
        size: iconSize,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: command.title,
      dwell: dwell,
      onActivated: () => _send(command),
    );
  }

  Widget _buildHeader(ThemeData theme, int page, int pageCount) {
    final title = _category == null
        ? LocaleKeys.basicCommandsScreen_titleOfPage.tr()
        : _category!.label;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          // مؤقت: ضغطة مطوّلة على اللوجو = خروج (المرافق هو اللي بيعملها)
          onLongPress: () async {
            await DeviceSession.clear();
            if (!mounted) return;
            context.goNamed(AppRoutes.chooseScreen);
          },
          child: Image.asset(AssetsApp.logo, width: 50, height: 50),
        ),
        Text(
          '$title  ${page + 1}/$pageCount',
          style: theme.textTheme.labelMedium,
        ),
      ],
    );
  }

  Widget _buildSent(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 72),
          const SizedBox(height: 12),
          Text(
            LocaleKeys.patientScreen_sent.tr(),
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 6),
          Text(_sentTitle!, style: theme.textTheme.labelMedium),
        ],
      ),
    );
  }

  Widget _navButton({
    required IconData icon,
    required String label,
    required Duration dwell,
    required VoidCallback onActivated,
  }) {
    return GazeButton(
      dwell: dwell,
      onActivated: onActivated,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }

  Widget _buildBottomRow(
      ThemeData theme,
      double height,
      Duration dwell,
      Duration emergencyDwell,
      int page,
      int pageCount,
      ) {
    final showPrevious = _category != null || pageCount > 1;
    final showNext = pageCount > 1;
    final previousLabel = (_category != null && page == 0)
        ? LocaleKeys.patientScreen_back.tr()
        : LocaleKeys.patientScreen_previous.tr();

    // الصف ده دايماً LTR: السابق على شمال الشاشة والتالي على اليمين،
    // حتى لو اللغة عربي (من غير كده Flutter بيقلب الترتيب)
    return SizedBox(
      height: height,
      child: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: showPrevious
                  ? _navButton(
                icon: Icons.arrow_back_ios_new,
                label: previousLabel,
                dwell: dwell,
                onActivated: () => _previous(page, pageCount),
              )
                  : const SizedBox(),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 4,
              child: GazeButton(
                color: const Color(0xFFB75151),
                progressColor: Colors.white,
                dwell: emergencyDwell, // أطول عشان ما يتفعّلش بالغلط
                onActivated: _startEmergencyCountdown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.warning_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      LocaleKeys.basicCommandsScreen_emergencyCommand.tr(),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 3,
              child: showNext
                  ? _navButton(
                icon: Icons.arrow_forward_ios,
                label: LocaleKeys.patientScreen_next.tr(),
                dwell: dwell,
                onActivated: () => _next(page, pageCount),
              )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyCountdown(ThemeData theme, Size size, Duration dwell) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.warning_rounded,
            color: Color(0xFFB75151),
            size: 56,
          ),
          const SizedBox(height: 8),
          Text(
            LocaleKeys.patientScreen_emergencyCountdown.tr(),
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          Text(
            '$_emergencyCountdown',
            style: theme.textTheme.displayLarge?.copyWith(
              color: const Color(0xFFB75151),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: size.width * 0.5,
            height: size.height * 0.25,
            child: GazeButton(
              dwell: dwell,
              onActivated: _cancelEmergency,
              child: Center(
                child: Text(
                  LocaleKeys.patientScreen_cancel.tr(),
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: StyleApp.pagePadding,
          child: ListenableBuilder(
            listenable: CommandsStore.instance,
            builder: (context, _) {
              final store = CommandsStore.instance;
              final settings = store.settings;

              if (_emergencyCountdown != null) {
                return _buildEmergencyCountdown(theme, size, settings.dwell);
              }

              final commands = _category == null
                  ? <Command>[]
                  : store.enabledIn(_category!);
              final itemCount = _category == null
                  ? CommandsStore.categories.length
                  : commands.length;
              final pageCount = itemCount == 0 ? 1 : (itemCount + 1) ~/ 2;
              final page = _page >= pageCount ? pageCount - 1 : _page;
              final start = page * 2;
              final iconSize = size.height * 0.18;

              final Widget body;
              if (_sentTitle != null) {
                body = _buildSent(theme);
              } else if (itemCount == 0) {
                body = Center(
                  child: Text(
                    LocaleKeys.patientScreen_noCommands.tr(),
                    style: theme.textTheme.titleLarge,
                  ),
                );
              } else {
                body = Row(
                  children: [
                    Expanded(
                      child: _buildSlot(
                        start,
                        commands,
                        iconSize,
                        settings.dwell,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: start + 1 < itemCount
                          ? _buildSlot(
                        start + 1,
                        commands,
                        iconSize,
                        settings.dwell,
                      )
                          : const SizedBox(),
                    ),
                  ],
                );
              }

              return Column(
                children: [
                  _buildHeader(theme, page, pageCount),
                  const SizedBox(height: 10),
                  Expanded(child: body),
                  const SizedBox(height: 10),
                  _buildBottomRow(
                    theme,
                    size.height * 0.14,
                    settings.dwell,
                    settings.emergencyDwell,
                    page,
                    pageCount,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}