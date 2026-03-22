import 'package:calmscious/core/router/app_routes.dart';
import 'package:calmscious/features/onboarding/view/onboarding_screen.dart';
import 'package:calmscious/features/splash/view/splash_screen.dart';
import 'package:calmscious/features/home/view/home_screen.dart';
import 'package:calmscious/features/auth/view/auth_selection_screen.dart';
import 'package:calmscious/features/auth/view/mobile_number_screen.dart';
import 'package:calmscious/features/auth/view/otp_screen.dart';
import 'package:calmscious/features/auth/view/profile_setup_screen.dart';
import 'package:calmscious/features/auth/view/goals_screen.dart';
import 'package:calmscious/features/notifications/view/notifications_screen.dart';
import 'package:calmscious/features/courses/view/all_courses_screen.dart';
import 'package:calmscious/features/courses/view/course_detail_screen.dart';
import 'package:calmscious/features/books/view/add_books_screen.dart';
import 'package:flutter/material.dart';

/// Central router — maps named routes to screens.
/// Add every new screen here; never use MaterialPageRoute inline in widgets.
class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _fade(const SplashScreen());
      case AppRoutes.onboarding:
        return _fade(const OnboardingScreen());
      case AppRoutes.authSelection:
        return _fade(const AuthSelectionScreen());
      case AppRoutes.mobileNumber:
        return _fade(const MobileNumberScreen());
      case AppRoutes.otp:
        return _fade(const OtpScreen());
      case AppRoutes.profileSetup:
        return _fade(const ProfileSetupScreen());
      case AppRoutes.goals:
        return _fade(const GoalsScreen());
      case AppRoutes.home:
        return _fade(const HomeScreen());
      case AppRoutes.notifications:
        return _fade(const NotificationsScreen());
      case AppRoutes.allCourses:
        return _fade(const AllCoursesScreen());
      case AppRoutes.courseDetail:
        return _fade(const CourseDetailScreen());
      case AppRoutes.addBooks:
        return _fade(const AddBooksScreen());
      default:
        return _fade(_NotFoundScreen(route: settings.name ?? ''));
    }
  }

  // Smooth fade transition
  static PageRoute<T> _fade<T>(Widget page) => PageRouteBuilder<T>(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 400),
      );
}

class _NotFoundScreen extends StatelessWidget {
  const _NotFoundScreen({required this.route});
  final String route;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(child: Text('No route defined for "$route"')),
      );
}
