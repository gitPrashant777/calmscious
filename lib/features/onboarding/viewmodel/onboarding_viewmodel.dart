import 'package:flutter/material.dart';
import 'package:calmscious/core/router/app_routes.dart';
import 'package:calmscious/features/onboarding/model/onboarding_model.dart';

/// ViewModel for [OnboardingScreen].
///
/// Responsibilities:
///  - Owns the [PageController].
///  - Tracks the current page index.
///  - Exposes [nextPage] action.
///  - Navigates to home when all pages are exhausted.
class OnboardingViewModel extends ChangeNotifier {
  final List<OnboardingModel> pages = OnboardingModel.pages;

  final PageController pageController = PageController();

  int _currentPage = 0;
  int get currentPage => _currentPage;

  bool get isLastPage => _currentPage == pages.length - 1;

  /// Called when the user taps the Next / Get Started button.
  void nextPage(BuildContext context) {
    if (isLastPage) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.authSelection);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Called by [PageView.onPageChanged].
  void onPageChanged(int index) {
    _currentPage = index;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
