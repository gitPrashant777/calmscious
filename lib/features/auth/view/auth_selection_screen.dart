import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calmscious/core/constants/app_colors.dart';
import 'package:calmscious/core/constants/app_images.dart';
import 'package:calmscious/core/constants/app_strings.dart';
import 'package:calmscious/features/auth/viewmodel/auth_viewmodel.dart';

class AuthSelectionScreen extends StatelessWidget {
  const AuthSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AuthViewModel>();

    return Scaffold(
      backgroundColor: AppColors.backgroundSplash,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Grid Image
          Image.asset(
            AppImages.authSectionBg,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: AppColors.primaryLight),
          ),

          // Gradient Overlay to ensure text readability at the bottom
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.backgroundSplash.withOpacity(0.0),
                    AppColors.backgroundSplash.withOpacity(0.9),
                    AppColors.backgroundSplash,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.4, 0.7, 1.0],
                ),
              ),
            ),
          ),

          // Action Buttons
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Continue with OTP Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () => vm.navToMobileNumber(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonBackground,
                        foregroundColor: AppColors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      icon: const Icon(Icons.phone_outlined, size: 22),
                      label: const Text(
                        AppStrings.continueWithOtp,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Continue with Google Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () => vm.navToProfileSetup(context), // Mapped straight to profile for demo
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.textPrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      icon: Image.asset(
                        AppImages.googleIcon,
                        width: 24,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.g_mobiledata),
                      ),
                      label: const Text(
                        AppStrings.continueWithGoogle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Terms & Conditions
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 11,
                        height: 1.5,
                      ),
                      children: _parseTermsAndConditions(),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TextSpan> _parseTermsAndConditions() {
    final spans = <TextSpan>[];
    const text = AppStrings.termsAndConditions;
    
    // Simplistic parsing for the specific formatting
    final parts = text.split('Terms & Conditions');
    spans.add(TextSpan(text: parts[0]));
    spans.add(const TextSpan(
      text: 'Terms & Conditions',
      style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
    ));
    final subParts = parts[1].split('Privacy Policy');
    spans.add(TextSpan(text: subParts[0]));
    spans.add(const TextSpan(
      text: 'Privacy Policy',
      style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
    ));
    spans.add(TextSpan(text: subParts[1]));

    return spans;
  }
}
