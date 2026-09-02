import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Typography tokens: Plus Jakarta Sans for headings, Inter for body — the
/// tight-tracked-headline / clean-body pairing typical of modern
/// SaaS marketing sites.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle _heading(double size, FontWeight weight, Color color, {double? height, double? letterSpacing}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle _inter(double size, FontWeight weight, Color color, {double? height}) {
    return GoogleFonts.inter(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
    );
  }

  // Display / headline
  static TextStyle displayLight({double size = 52}) =>
      _heading(size, FontWeight.w700, AppColors.textPrimary, height: 1.08, letterSpacing: -1.0);
  static TextStyle displayDark({double size = 52}) =>
      _heading(size, FontWeight.w700, AppColors.textOnDarkPrimary, height: 1.08, letterSpacing: -1.0);

  static TextStyle h2Light({double size = 34}) =>
      _heading(size, FontWeight.w700, AppColors.textPrimary, height: 1.15, letterSpacing: -0.5);
  static TextStyle h2Dark({double size = 34}) =>
      _heading(size, FontWeight.w700, AppColors.textOnDarkPrimary, height: 1.15, letterSpacing: -0.5);

  static TextStyle h3Light({double size = 20}) =>
      _heading(size, FontWeight.w600, AppColors.textPrimary, height: 1.3);
  static TextStyle h3Dark({double size = 20}) =>
      _heading(size, FontWeight.w600, AppColors.textOnDarkPrimary, height: 1.3);

  static TextStyle statNumber({double size = 40, Color? color}) =>
      _heading(size, FontWeight.w700, color ?? AppColors.textPrimary, letterSpacing: -0.5);

  // Body
  static TextStyle eyebrow({Color? color}) => _inter(13, FontWeight.w600, color ?? AppColors.accentStart)
      .copyWith(letterSpacing: 1.6);

  static TextStyle bodyLight({double size = 16}) =>
      _inter(size, FontWeight.w400, AppColors.textSecondary, height: 1.55);
  static TextStyle bodyDark({double size = 16}) =>
      _inter(size, FontWeight.w400, AppColors.textOnDarkSecondary, height: 1.55);

  static TextStyle labelLight({double size = 14}) =>
      _inter(size, FontWeight.w600, AppColors.textPrimary, height: 1.4);
  static TextStyle labelDark({double size = 14}) =>
      _inter(size, FontWeight.w600, AppColors.textOnDarkPrimary, height: 1.4);

  static TextStyle button() => _inter(15, FontWeight.w600, Colors.white);
}
