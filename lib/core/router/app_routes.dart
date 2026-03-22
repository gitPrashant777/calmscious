/// Named route constants used by the AppRouter.
class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home'; // placeholder – add later

  // Auth flow
  static const String authSelection = '/auth_selection';
  static const String mobileNumber = '/mobile_number';
  static const String otp = '/otp';
  static const String profileSetup = '/profile_setup';
  static const String goals = '/goals';

  // Main flow
  static const String notifications = '/notifications';
  static const String allCourses = '/all_courses';
  static const String courseDetail = '/course_detail';
  static const String addBooks = '/add_books';

  // New Routes
  static const String liveSessions = '/live_sessions';
  static const String payment = '/payment';
  static const String chat = '/chat';
  static const String profile = '/profile';
  static const String liveSessionDetail = '/live_session_detail';

  // New Provider/Booking Routes
  static const String createProfile = '/create_profile';
  static const String coachSessionDetails = '/coach_session_details';
  static const String selectDateTime = '/select_date_time';
  static const String addMasterclass = '/add_masterclass';
  static const String selectService = '/select_service';
}
