import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calmscious/core/constants/app_colors.dart';
import 'package:calmscious/core/constants/app_strings.dart';
import 'package:calmscious/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/cupertino.dart'; // For the generic icons

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>(); // watching for list toggles

    return Scaffold(
      backgroundColor: AppColors.backgroundOnboarding,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    height: 1.3,
                  ),
                  children: [
                    TextSpan(text: AppStrings.goalsTitle),
                    TextSpan(
                      text: 'Calmscious',
                      style: TextStyle(
                        fontFamily: 'Cursive', // mock cursive for italic brand name in image
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(text: ' ?'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                AppStrings.goalsSub,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 38),
              
              // Goals list
              Expanded(
                child: ListView.separated(
                  itemCount: AppStrings.goalOptions.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final goal = AppStrings.goalOptions[index];
                    final isSelected = vm.selectedGoals.contains(index);
                    
                    // Simple mock icons for goals
                    final icons = [
                      Icons.spa_outlined,
                      Icons.self_improvement_outlined,
                      Icons.accessibility_new_outlined,
                      Icons.nights_stay_outlined,
                    ];

                    return GestureDetector(
                      onTap: () => vm.toggleGoal(index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryLight : AppColors.primaryLight.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(30), // thick pill shape
                        ),
                        child: Row(
                          children: [
                            Icon(icons[index], color: AppColors.textPrimary, size: 24),
                            const SizedBox(width: 16),
                            Text(
                              goal,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              // Bottom continue full width button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => vm.finishAuth(context), // navigate to home
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
