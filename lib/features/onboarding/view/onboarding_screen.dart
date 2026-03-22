import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calmscious/core/constants/app_colors.dart';
import 'package:calmscious/core/constants/app_strings.dart';
import 'package:calmscious/features/onboarding/viewmodel/onboarding_viewmodel.dart';

/// [OnboardingScreen] — three swipeable pages that introduce the app.
///
/// Architecture: MVVM
///  - View  → this file (pure UI)
///  - ViewModel → [OnboardingViewModel]
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OnboardingViewModel>();

    return Scaffold(
      backgroundColor: AppColors.backgroundOnboarding,
      body: Column(
        children: [
          // ── PageView (image + dots + text) ─────────────────────────────────
          Expanded(
            child: PageView.builder(
              controller: vm.pageController,
              onPageChanged: vm.onPageChanged,
              itemCount: vm.pages.length,
              itemBuilder: (context, index) =>
                  _OnboardingPage(page: vm.pages[index]),
            ),
          ),

          // ── Dot indicators ─────────────────────────────────────────────────
          _DotIndicator(
            count: vm.pages.length,
            currentIndex: vm.currentPage,
          ),

          const SizedBox(height: 32),

          // ── Next / Get Started button ──────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: _NextButton(
              label: vm.isLastPage
                  ? AppStrings.getStarted
                  : AppStrings.next,
              onTap: () => vm.nextPage(context),
            ),
          ),

          const SizedBox(height: 48),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Private sub-widgets
// ─────────────────────────────────────────────────────────────────────────────

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({required this.page});
  final dynamic page; // OnboardingModel

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Circular image ──────────────────────────────────────────────────
        ClipPath(
          clipper: _BottomCircleClipper(),
          child: SizedBox(
            width: double.infinity,
            height: size.height * 0.52,
            child: Image.asset(
              page.imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 24),

        // ── Title ────────────────────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Text(
            page.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              height: 1.3,
            ),
          ),
        ),

        const SizedBox(height: 12),

        // ── Description ───────────────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Text(
            page.description,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.textSecondary,
              height: 1.55,
            ),
          ),
        ),
      ],
    );
  }
}

/// Clips the bottom of a rectangle into a big downward circle,
/// matching the "stadium/circle bottom" look in the designs.
class _BottomCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 60,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_BottomCircleClipper oldClipper) => false;
}

class _DotIndicator extends StatelessWidget {
  const _DotIndicator({required this.count, required this.currentIndex});
  final int count;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 28 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? AppColors.dotActive : AppColors.dotInactive,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonBackground,
          foregroundColor: AppColors.buttonText,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
