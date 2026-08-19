import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

/// Rounded card with soft layered shadow — the base unit of the bento grid
/// aesthetic. `dark: true` renders as a translucent panel meant to sit on
/// a dark section background; `dark: false` renders as a white card meant
/// to sit on the light background.
class BentoCard extends StatelessWidget {
  final Widget child;
  final bool dark;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const BentoCard({
    super.key,
    required this.child,
    this.dark = false,
    this.padding = const EdgeInsets.all(28),
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: dark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: dark ? AppColors.borderDark : AppColors.borderLight),
        boxShadow: dark
            ? null
            : [
                BoxShadow(
                  color: const Color(0xFF0F172A).withValues(alpha: 0.05),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
                BoxShadow(
                  color: const Color(0xFF0F172A).withValues(alpha: 0.03),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: child,
    );
  }
}
