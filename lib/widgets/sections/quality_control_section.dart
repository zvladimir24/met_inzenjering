import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/bento_card.dart';
import '../common/section_header.dart';
import '../common/section_scaffold.dart';

class QualityControlSection extends StatelessWidget {
  const QualityControlSection({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return SectionScaffold(
      dark: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: qualityCopy.eyebrow.of(locale),
            title: qualityCopy.title.of(locale),
            dark: true,
            subtitle: qualityCopy.subtitle?.of(locale),
          ),
          const SizedBox(height: 40),
          for (final step in qualitySteps)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _QualityStepCard(step),
            ),
        ],
      ),
    );
  }
}

class _QualityStepCard extends StatelessWidget {
  final QualityStepData step;
  const _QualityStepCard(this.step);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return BentoCard(
      dark: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => AppColors.accentGradient.createShader(bounds),
            child: Text(step.number, style: AppTextStyles.statNumber(size: 32, color: Colors.white)),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(step.title.of(locale), style: AppTextStyles.h3Dark(size: 17)),
                const SizedBox(height: 6),
                Text(step.description.of(locale), style: AppTextStyles.bodyDark(size: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
