import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// بيراقب تنقل الشاشات، وبنسجله في الـ GoRouter
final RouteObserver<ModalRoute<void>> appRouteObserver =
RouteObserver<ModalRoute<void>>();

enum ScreenOrientation { portrait, landscape }

Future<void> setAppOrientation(ScreenOrientation orientation) {
  return SystemChrome.setPreferredOrientations(
    orientation == ScreenOrientation.portrait
        ? [DeviceOrientation.portraitUp]
        : [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
  );
}

/// أي شاشة (State) تضيف `with OrientationAware` وتحدد الاتجاه اللي عايزاه.
/// الاتجاه بيتطبق لما الشاشة تظهر، ولما نرجع لها بعد ما شاشة فوقها تتقفل.
mixin OrientationAware<T extends StatefulWidget> on State<T>
implements RouteAware {
  ScreenOrientation get orientation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route != null) appRouteObserver.subscribe(this, route);
  }

  @override
  void dispose() {
    appRouteObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() => setAppOrientation(orientation); // الشاشة اتفتحت

  @override
  void didPopNext() => setAppOrientation(orientation); // شاشة فوقها اتقفلت

  @override
  void didPop() {}

  @override
  void didPushNext() {}
}