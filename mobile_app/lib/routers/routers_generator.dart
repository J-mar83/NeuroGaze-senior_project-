import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/screens/BasicApp/changed_pass_screen.dart';
import 'package:mobile_app/screens/BasicApp/forget_pass_screen.dart';
import 'package:mobile_app/screens/BasicApp/new_pass_screen.dart';
import 'package:mobile_app/screens/BasicApp/otp_screen.dart';
import 'package:mobile_app/screens/Patient/basic_commands.dart';
import 'package:mobile_app/screens/BasicApp/choose_screen.dart';
import 'package:mobile_app/screens/BasicApp/login_screen.dart';
import 'package:mobile_app/screens/BasicApp/register_screen.dart';
import 'package:mobile_app/screens/BasicApp/splash_screen.dart';
import 'package:mobile_app/screens/Companion/companion_shell.dart';
import 'package:mobile_app/models/user_role.dart';
import 'package:mobile_app/screens/Companion/patient_details_screen.dart';
import 'package:mobile_app/screens/Companion/request_details_screen.dart';
import 'package:mobile_app/utils/orientation_aware.dart';

class RoutersGenerator {
  static final GoRouter mainRoutingInOutApp = GoRouter(
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text("This Router is not found 404"))),
    initialLocation: AppRoutes.slaphScreen,
    observers: [appRouteObserver],
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
        GoRoute(
        name: AppRoutes.forgetPass,
        path: AppRoutes.forgetPass,
        builder: (context, state) => const ForgetPass(),
      ),
        GoRoute(
        name: AppRoutes.newPass,
        path: AppRoutes.newPass,
        builder: (context, state) => const NewPassScreen(),
      ),
  GoRoute(
        name: AppRoutes.otpScreen,
        path: AppRoutes.otpScreen,
        builder: (context, state) => const OtpScreen(),
      ),
  GoRoute(
        name: AppRoutes.changedpass,
        path: AppRoutes.changedpass,
        builder: (context, state) => const PassSuccess(),
      ),      
    ],
  );
}

