import 'package:flutter/material.dart';
import 'package:calmscious/core/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: AppColors.backgroundSplash,
        elevation: 0,
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Welcome to Calmscious!',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
