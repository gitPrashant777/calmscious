import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calmscious/core/constants/app_colors.dart';
import 'package:calmscious/core/constants/app_images.dart';
import 'package:calmscious/core/constants/app_strings.dart';
import 'package:calmscious/features/splash/viewmodel/splash_viewmodel.dart';

/// [SplashScreen] — the first screen users see.
///
/// Architecture: MVVM
///  - View  → this file (pure UI, no business logic)
///  - ViewModel → [SplashViewModel]
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();

    // Animate logo in
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _scaleAnim = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();

    // Delegate navigation logic to ViewModel
    context.read<SplashViewModel>().init(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSplash,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => FadeTransition(
            opacity: _fadeAnim,
            child: ScaleTransition(
              scale: _scaleAnim,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppImages.splashLogo,
                    width: 52,
                    height: 52,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    AppStrings.appName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
