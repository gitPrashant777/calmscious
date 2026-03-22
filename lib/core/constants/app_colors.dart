import 'package:flutter/material.dart';

/// Central color palette for the Calmscious app.
/// All color values must be defined here — never hardcoded in widgets.
class AppColors {
  AppColors._(); // Prevent instantiation

  // ── Brand ──────────────────────────────────────────────────────────────────
  static const Color primary = Color(0xFF2EC4C4); // Teal / brand cyan
  static const Color primaryLight = Color(0xFF7FE0E0);
  static const Color primaryDark = Color(0xFF1A9999);

  // ── Background ─────────────────────────────────────────────────────────────
  static const Color backgroundSplash = Color(0xFFE0F7F7); // Pale mint
  static const Color backgroundOnboarding = Color(0xFFE8F8F8); // Light aqua

  // ── Text ───────────────────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFF1A2B2B); // Deep dark teal-black
  static const Color textSecondary = Color(0xFF5A7A7A); // Muted grey-teal
  static const Color textOnPrimary = Color(0xFFFFFFFF); // White on dark bg

  // ── Indicators ─────────────────────────────────────────────────────────────
  static const Color dotActive = Color(0xFF2EC4C4); // Active page dot
  static const Color dotInactive = Color(0xFFB2DCDC); // Inactive page dot

  // ── Button ─────────────────────────────────────────────────────────────────
  static const Color buttonBackground = Color(0xFF2EC4C4);
  static const Color buttonText = Color(0xFFFFFFFF);
  static const Color buttonOrange = Color(0xFFE48B69);

  // ── Chips & Banners ───────────────────────────────────────────────────────
  static const Color bannerOrange = Color(0xFFF19E7A);
  static const Color chipBackground = Color(0xFFE0F7F7); // Cyan light
  static const Color chipOrange = Color(0xFFE48B69); // Intermediate chip

  // ── Misc ───────────────────────────────────────────────────────────────────
  static const Color transparent = Colors.transparent;
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color divider = Color(0xFFCDE9E9);
  static const Color cardShadow = Color(0x1A000000); // 10% black
  static const Color starRating = Color(0xFFFFD700);
  static const Color greyBackground = Color(0xFFF5F5F5); // Books grid generic
}
