import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/screens/basic_commands.dart';
import 'package:mobile_app/screens/choose_screen.dart';
import 'package:mobile_app/screens/login_screen.dart';
import 'package:mobile_app/screens/register_screen.dart';
import 'package:mobile_app/screens/splash_screen.dart';
import 'package:mobile_app/screens/companion/companion_shell.dart';
import 'package:mobile_app/models/user_role.dart';
import 'package:mobile_app/screens/companion/patient_details_screen.dart';
import 'package:mobile_app/screens/companion/request_details_screen.dart';

class RoutersGenerator {
  static final GoRouter mainRoutingInOutApp = GoRouter(
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text("This Router is not found 404"))),
    initialLocation: AppRoutes.slaphScreen,
    routes: [
      GoRoute(
        name: AppRoutes.slaphScreen,
        path: AppRoutes.slaphScreen,
        builder: (context, state) => const SplasScreen(),
      ),
      GoRoute(
        name: AppRoutes.chooseScreen,
        path: AppRoutes.chooseScreen,
        builder: (context, state) => const ChooseScreen(),
      ),
      GoRoute(
        name: AppRoutes.loginScreen,
        path: AppRoutes.loginScreen,
        builder: (context, state) => Loginscreen(
          role: state.extra as UserRole? ?? UserRole.patient,
        ),
      ),
      GoRoute(
        name: AppRoutes.registerScreen,
        path: AppRoutes.registerScreen,
        builder: (context, state) => RegisterScreen(
          role: state.extra as UserRole? ?? UserRole.patient,
        ),
      ),
      GoRoute(
        name: AppRoutes.basicCommandScreen,
        path: AppRoutes.basicCommandScreen,
        builder: (context, state) => const BasicCommands(),
      ),
      GoRoute(
        name: AppRoutes.companionShell,
        path: AppRoutes.companionShell,
        builder: (context, state) => const CompanionShell(),
      ),
      GoRoute(
        name: AppRoutes.patientDetails,
        path: '${AppRoutes.patientDetails}/:id',
        builder: (context, state) => PatientDetailsScreen(
          patientId: state.pathParameters['id']!,
        ),
      ),
      GoRoute(
        name: AppRoutes.requestDetails,
        path: '${AppRoutes.requestDetails}/:id',
        builder: (context, state) => RequestDetailsScreen(
          requestId: state.pathParameters['id']!,
        ),
      ),
    ],
  );
}

