import 'package:flutter/material.dart';

/// Color tokens for the Bento / SaaS Modern design direction.
class AppColors {
  AppColors._();

  // Base surfaces
  static const Color lightBg = Color(0xFFF9FAFB);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color darkBg = Color(0xFF101828);
  static const Color darkSurface = Color(0xFF1A2437);

  // Borders / dividers
  static const Color borderLight = Color(0xFFE5E9F0);
  static const Color borderDark = Color(0xFF2A3549);

  // Text
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF5B6472);
  static const Color textOnDarkPrimary = Color(0xFFF8FAFC);
  static const Color textOnDarkSecondary = Color(0xFF9AA6BA);

  // Accent gradient (red -> orange), echoes the Met Inženjering mark
  static const Color accentStart = Color(0xFFE8384F);
  static const Color accentEnd = Color(0xFFFF7A45);

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accentStart, accentEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkPanelGradient = LinearGradient(
    colors: [Color(0xFF0C1522), Color(0xFF17233A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static Color accentAlpha(double opacity) => accentStart.withValues(alpha: opacity);
}
