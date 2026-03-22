import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calmscious/core/constants/app_colors.dart';
import 'package:calmscious/core/constants/app_strings.dart';
import 'package:calmscious/features/auth/viewmodel/auth_viewmodel.dart';

class ProfileSetupScreen extends StatelessWidget {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AuthViewModel>();

    return Scaffold(
      backgroundColor: AppColors.backgroundOnboarding, // it has that pale blue shade in screenshot
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppStrings.onboardingProfileTitle,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 32),
              
              const _LabeledTextField(
                label: AppStrings.nameLabel,
              ),
              const SizedBox(height: 16),
              const _LabeledTextField(
                label: AppStrings.dobLabel,
              ),
              
              const Spacer(),
              
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => vm.navToGoals(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonBackground,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text(
                    AppStrings.continueText,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _LabeledTextField extends StatelessWidget {
  const _LabeledTextField({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    // The screenshot has the label floating on the border of the textfield, 
    // which is perfectly achieved with InputDecoration's labelText.
    return SizedBox(
      height: 58,
      child: TextField(
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.textSecondary, width: 0.8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
    );
  }
}
