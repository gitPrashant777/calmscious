import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:calmscious/core/constants/app_colors.dart';
import 'package:calmscious/core/router/app_router.dart';
import 'package:calmscious/core/router/app_routes.dart';
import 'package:calmscious/features/splash/viewmodel/splash_viewmodel.dart';
import 'package:calmscious/features/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:calmscious/features/auth/viewmodel/auth_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Force portrait orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Transparent status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const CalmSciousApp());
}

class CalmSciousApp extends StatelessWidget {
  const CalmSciousApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Splash
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
        // Onboarding
        ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
        // Auth
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
        title: 'Calmscious',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            brightness: Brightness.light,
          ),
          scaffoldBackgroundColor: AppColors.backgroundSplash,
        ),
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
