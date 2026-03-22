import 'package:calmscious/core/constants/app_images.dart';
import 'package:calmscious/core/constants/app_strings.dart';

/// Data model for a single onboarding page.
class OnboardingModel {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  /// The three fixed onboarding pages.
  static List<OnboardingModel> get pages => [
        OnboardingModel(
          imagePath: AppImages.onboardingOne,
          title: AppStrings.onboardingTitles[0],
          description: AppStrings.onboardingDescriptions[0],
        ),
        OnboardingModel(
          imagePath: AppImages.onboardingTwo,
          title: AppStrings.onboardingTitles[1],
          description: AppStrings.onboardingDescriptions[1],
        ),
        OnboardingModel(
          imagePath: AppImages.onboardingThree,
          title: AppStrings.onboardingTitles[2],
          description: AppStrings.onboardingDescriptions[2],
        ),
      ];
}
