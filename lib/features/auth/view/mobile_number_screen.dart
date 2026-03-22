import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calmscious/core/constants/app_colors.dart';
import 'package:calmscious/core/constants/app_strings.dart';
import 'package:calmscious/features/auth/viewmodel/auth_viewmodel.dart';

class MobileNumberScreen extends StatelessWidget {
  const MobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AuthViewModel>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.textPrimary, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppStrings.enterMobileTitle,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(text: 'Lets '),
                    TextSpan(
                      text: 'create',
                      style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                    ),
                    TextSpan(text: ' or '),
                    TextSpan(
                      text: 'find',
                      style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                    ),
                    TextSpan(text: ' your account. We\'ll send you a \nsecurity code to verify that its really you.'),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              Row(
                children: [
                  // Country Code block
                  Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.dotInactive),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('+91', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                        SizedBox(width: 8),
                        Text('🇮🇳', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  
                  // Mobile Input
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: TextField(
                        controller: vm.mobileController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          hintText: 'Mobile no.',
                          hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: AppColors.dotInactive),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const Spacer(),

              // Use centered button to match screenshot (small pill form)
              Center(
                child: SizedBox(
                  width: 180,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () => vm.navToOtp(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonBackground,
                      foregroundColor: AppColors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      AppStrings.continueText,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
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
