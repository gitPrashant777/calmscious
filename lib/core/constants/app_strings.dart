/// All user-facing strings for the Calmscious app.
class AppStrings {
  AppStrings._();

  static const String appName = 'Calmscious';

  // Onboarding
  static const List<String> onboardingTitles = [
    'Find Your Inner Stillness',
    'Movement & Balance',
    'Nature & Soundscapes',
  ];

  static const List<String> onboardingDescriptions = [
    'Begin your journey toward mental clarity. Take a moment to breathe, let go of daily stress, and reconnect with your true self through guided mindfulness',
    'Restore your energy with intentional movement. Explore simple yoga and stretching routines designed to balance your body and uplift your spirit every day.',
    'Immerse yourself in the restorative power of nature. From gentle ocean waves to mountain echoes, find the perfect soundscape to soothe your mind and enhance focus.',
  ];

  static const String next = 'Next';
  static const String getStarted = 'Get Started';
  static const String continueText = 'Continue';
  static const String verify = 'Verify';

  // Auth Selection
  static const String continueWithOtp = 'Continue with OTP';
  static const String continueWithGoogle = 'Continue with Google';
  static const String termsAndConditions =
      'By continuing you agree to our Terms & Conditions and \nPrivacy Policy and receiving calls from us even if your number \nis registered with NCPR';

  // Mobile Number
  static const String enterMobileTitle = 'Enter Your Mobile Number';
  static const String enterMobileSub =
      'Lets create or find your account. We\'ll send you a \nsecurity code to verify that its really you.';

  // OTP
  static const String otpTitle = 'We just sent you an E-Mail';
  static const String otpSub = 'Enter the security code we sent to \nPra********74@gmail.com'; // Hardcoded for UI demo
  static const String resendOtp = 'Resend OTP in ';

  // Profile Setup
  static const String onboardingProfileTitle = 'Onboarding';
  static const String nameLabel = 'Name*';
  static const String dobLabel = 'Date of birth*';

  // Goals
  static const String goalsTitle = 'What brings you to ';
  static const String goalsSub =
      'we will personalize recommendations based on your goals';
  static const List<String> goalOptions = [
    'Build Self Esteem',
    'Reduce Stress',
    'Motivate yourself',
    'Better Sleep',
  ];
}
