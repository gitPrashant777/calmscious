import 'dart:async';
import 'package:flutter/material.dart';
import 'package:calmscious/core/router/app_routes.dart';

class AuthViewModel extends ChangeNotifier {
  // --- Mobile Number Screen State ---
  final TextEditingController mobileController = TextEditingController();
  
  // --- OTP Screen State ---
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  int _otpTimer = 14;
  Timer? _timer;

  int get otpTimer => _otpTimer;
  String get formattedOtpTimer => '00:${_otpTimer.toString().padLeft(2, '0')}';

  // --- Profile / Name DOB State ---
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  // --- Goals State ---
  final List<int> _selectedGoals = [];
  List<int> get selectedGoals => _selectedGoals;

  void toggleGoal(int index) {
    if (_selectedGoals.contains(index)) {
      _selectedGoals.remove(index);
    } else {
      _selectedGoals.add(index);
    }
    notifyListeners();
  }

  // --- Navigation logic ---

  void navToMobileNumber(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.mobileNumber);
  }

  void navToOtp(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.otp);
    startOtpTimer();
  }

  void navToProfileSetup(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.profileSetup);
  }

  void navToGoals(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.goals);
  }

  void finishAuth(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.home,
      (route) => false,
    );
  }

  // --- OTP Timer Logic ---

  void startOtpTimer() {
    _otpTimer = 14;
    _timer?.cancel();
    notifyListeners();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_otpTimer > 0) {
        _otpTimer--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  void stopOtpTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    mobileController.dispose();
    for (var c in otpControllers) {
      c.dispose();
    }
    nameController.dispose();
    dobController.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
