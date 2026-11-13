import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/screens/choose_screen.dart';
import 'package:mobile_app/screens/login_screen.dart';
import 'package:mobile_app/screens/register_screen.dart';
import 'package:mobile_app/screens/splash_screen.dart';

class RoutersGenerator {
  static final GoRouter mainRoutingInOutApp = GoRouter(
    errorBuilder:(context, state) => Scaffold(body:Center(child:Text("This Router is not found 404"))),
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
        builder: (context, state) => const Loginscreen(),
      ),
      GoRoute(
        name: AppRoutes.registerScreen,
        path: AppRoutes.registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
}

