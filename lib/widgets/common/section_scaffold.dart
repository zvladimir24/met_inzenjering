import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../utils/responsive.dart';

/// Standard section wrapper: full-width colored background, centered
/// content column capped at [Responsive.contentMaxWidth], consistent
/// vertical rhythm.
class SectionScaffold extends StatelessWidget {
  final Widget child;
  final bool dark;
  final Color? backgroundColor;

  const SectionScaffold({super.key, required this.child, this.dark = false, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    return Container(
      width: double.infinity,
      color: backgroundColor ?? (dark ? AppColors.darkBg : AppColors.lightBg),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.pagePadding(context),
        vertical: mobile ? 56 : 88,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: Responsive.contentMaxWidth),
          child: child,
        ),
      ),
    );
  }
}
