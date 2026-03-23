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
import 'package:calmscious/features/live_sessions/view/live_sessions_screen.dart';
import 'package:calmscious/features/live_sessions/view/live_session_detail_screen.dart';
import 'package:calmscious/features/payment/view/payment_screen.dart';
import 'package:calmscious/features/chat/view/chat_screen.dart';
import 'package:calmscious/features/profile/view/profile_screen.dart';
import 'package:calmscious/features/profile/view/create_profile_screen.dart';
import 'package:calmscious/features/sessions/view/coach_session_details_screen.dart';
import 'package:calmscious/features/booking/view/select_date_time_screen.dart';
import 'package:calmscious/features/courses/view/add_masterclass_screen.dart';
import 'package:calmscious/features/services/view/select_service_screen.dart';
import 'package:calmscious/features/home/view/admin_dashboard_screen.dart';
import 'package:calmscious/features/home/view/coach_management_screen.dart';
import 'package:calmscious/features/sessions/view/reschedule_session_screen.dart';
import 'package:calmscious/features/coaches/view/select_coach_screen.dart';
import 'package:calmscious/features/sessions/view/service_coach_details_screen.dart';
import 'package:calmscious/features/shop/view/cart_screen.dart';
import 'package:calmscious/features/shop/view/gifting_curations_screen.dart';
import 'package:calmscious/features/shop/view/product_details_screen.dart';
import 'package:calmscious/features/shop/view/checkout_screen.dart';
import 'package:calmscious/features/sessions/view/session_transcription_screen.dart';
import 'package:calmscious/features/shop/view/gift_return_request_screen.dart';
import 'package:calmscious/features/shop/view/review_gift_screen.dart';
import 'package:calmscious/features/shop/view/gift_reviews_screen.dart';
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
      case AppRoutes.liveSessions:
        return _fade(const LiveSessionsScreen());
      case AppRoutes.liveSessionDetail:
        return _fade(const LiveSessionDetailScreen());
      case AppRoutes.payment:
        return _fade(const PaymentScreen());
      case AppRoutes.chat:
        return _fade(const ChatScreen());
      case AppRoutes.profile:
        return _fade(const ProfileScreen());
      case AppRoutes.createProfile:
        return _fade(const CreateProfileScreen());
      case AppRoutes.coachSessionDetails:
        return _fade(const CoachSessionDetailsScreen());
      case AppRoutes.selectDateTime:
        return _fade(const SelectDateTimeScreen());
      case AppRoutes.addMasterclass:
        return _fade(const AddMasterclassScreen());
      case AppRoutes.selectService:
        return _fade(const SelectServiceScreen());
      case AppRoutes.adminDashboard:
        return _fade(const AdminDashboardScreen());
      case AppRoutes.coachManagement:
        return _fade(const CoachManagementScreen());
      case AppRoutes.rescheduleSession:
        return _fade(const RescheduleSessionScreen());
      case AppRoutes.selectCoach:
        return _fade(const SelectCoachScreen());
      case AppRoutes.serviceCoachDetails:
        return _fade(const ServiceCoachDetailsScreen());
      case AppRoutes.cart:
        return _fade(const CartScreen());
      case AppRoutes.giftingCurations:
        return _fade(const GiftingCurationsScreen());
      case AppRoutes.productDetails:
        return _fade(const ProductDetailsScreen());
      case AppRoutes.checkout:
        return _fade(const CheckoutScreen());
      case AppRoutes.sessionTranscription:
        return _fade(const SessionTranscriptionScreen());
      case AppRoutes.giftReturnRequest:
        return _fade(const GiftReturnRequestScreen());
      case AppRoutes.reviewGift:
        return _fade(const ReviewGiftScreen());
      case AppRoutes.giftReviews:
        return _fade(const GiftReviewsScreen());
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
