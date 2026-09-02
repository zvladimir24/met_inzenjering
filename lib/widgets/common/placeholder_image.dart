import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'reveal_on_scroll.dart';

/// A photo panel with consistent rounded/bordered styling. Pass [assetPath]
/// to render a real image (`BoxFit.cover`); omit it to fall back to a
/// gradient + centered icon placeholder for spots without a photo yet.
/// Fades/slides into place the first time it scrolls into view.
class PlaceholderImage extends StatelessWidget {
  final IconData icon;
  final double borderRadius;
  final bool dark;
  final double iconSize;
  final String? assetPath;
  final Duration revealDelay;

  const PlaceholderImage({
    super.key,
    required this.icon,
    this.borderRadius = 20,
    this.dark = false,
    this.iconSize = 40,
    this.assetPath,
    this.revealDelay = Duration.zero,
  });

  @override
  Widget build(BuildContext context) {
    return RevealOnScroll(
      delay: revealDelay,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: dark ? AppColors.borderDark : AppColors.borderLight,
            ),
          ),
          child: assetPath != null
              ? Image.asset(assetPath!, fit: BoxFit.cover)
              : Container(
                  decoration: BoxDecoration(
                    gradient: dark
                        ? AppColors.darkPanelGradient
                        : LinearGradient(
                            colors: [AppColors.accentAlpha(0.10), AppColors.accentAlpha(0.03)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    icon,
                    size: iconSize,
                    color: dark ? AppColors.textOnDarkSecondary : AppColors.accentAlpha(0.55),
                  ),
                ),
        ),
      ),
    );
  }
}
