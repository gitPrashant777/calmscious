import 'package:flutter/material.dart';
import 'package:calmscious/core/router/app_routes.dart';

/// ViewModel for [SplashScreen].
///
/// Responsibilities:
///  - Starts the splash timer.
///  - Navigates to onboarding once the delay has elapsed.
class SplashViewModel extends ChangeNotifier {
  /// Call once inside initState of the Splash view.
  void init(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
      }
    });
  }
}
