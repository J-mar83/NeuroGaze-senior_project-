import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/widgets/splash_content_widget.dart';
import 'package:mobile_app/data/device_session.dart';
import 'package:mobile_app/models/user_role.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      if (!mounted) return;

      final role = DeviceSession.role;
      if (role == UserRole.patient) {
        context.pushReplacementNamed(AppRoutes.basicCommandScreen);
      } else if (role == UserRole.companion) {
        context.pushReplacementNamed(AppRoutes.companionShell);
      } else {
        context.pushReplacementNamed(AppRoutes.chooseScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxHeight > 600) {
            return SplashContent(logoSize: 200, space: 10);
          } else {
            return SplashContent(logoSize: 100, space: 5);
          }
        },
      ),
    );
  }
}