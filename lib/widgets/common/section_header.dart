import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../utils/responsive.dart';

class SectionHeader extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String? subtitle;
  final bool dark;
  final CrossAxisAlignment align;

  const SectionHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.subtitle,
    this.dark = false,
    this.align = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    return Column(
      crossAxisAlignment: align,
      children: [
        Text(eyebrow.toUpperCase(), style: AppTextStyles.eyebrow()),
        const SizedBox(height: 12),
        Text(
          title,
          textAlign: align == CrossAxisAlignment.center ? TextAlign.center : TextAlign.left,
          style: dark
              ? AppTextStyles.h2Dark(size: mobile ? 26 : 34)
              : AppTextStyles.h2Light(size: mobile ? 26 : 34),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              subtitle!,
              textAlign: align == CrossAxisAlignment.center ? TextAlign.center : TextAlign.left,
              style: dark ? AppTextStyles.bodyDark() : AppTextStyles.bodyLight(),
            ),
          ),
        ],
      ],
    );
  }
}

/// Small rounded pill, used for ISO badges.
class PillBadge extends StatelessWidget {
  final String label;
  final bool dark;
  const PillBadge(this.label, {super.key, this.dark = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: dark ? Colors.white.withValues(alpha: 0.08) : AppColors.darkBg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: dark ? Colors.white.withValues(alpha: 0.16) : AppColors.darkBg),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelDark(size: 12.5),
      ),
    );
  }
}
