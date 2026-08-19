import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../utils/responsive.dart';
import '../common/bento_card.dart';
import '../common/placeholder_image.dart';
import '../common/responsive_grid.dart';
import '../common/section_header.dart';
import '../common/section_scaffold.dart';

class TechnicalDetailsSection extends StatelessWidget {
  const TechnicalDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final desktop = Responsive.isDesktop(context);
    final locale = AppLocaleScope.localeOf(context);

    final weldingCard = BentoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(weldingMethodsHeading.of(locale), style: AppTextStyles.h3Light()),
          const SizedBox(height: 18),
          for (final method in weldingMethods)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ${method.name.of(locale)}', style: AppTextStyles.labelLight(size: 14.5)),
                  const SizedBox(height: 4),
                  Text(method.description.of(locale), style: AppTextStyles.bodyLight(size: 13.5)),
                ],
              ),
            ),
        ],
      ),
    );

    final visual = AspectRatio(
      aspectRatio: 1.3,
      child: PlaceholderImage(
        icon: Icons.local_fire_department_outlined,
        assetPath: 'assets/images/technical/welder_sparks.jpeg',
      ),
    );

    return SectionScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: technicalDetailsCopy.eyebrow.of(locale),
            title: technicalDetailsCopy.title.of(locale),
          ),
          const SizedBox(height: 40),
          desktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: weldingCard),
                    const SizedBox(width: 24),
                    Expanded(flex: 4, child: visual),
                  ],
                )
              : Column(
                  children: [
                    weldingCard,
                    const SizedBox(height: 24),
                    visual,
                  ],
                ),
          const SizedBox(height: 24),
          ResponsiveGrid(
            children: [for (final feature in technicalFeatures) _FeatureTile(feature)],
          ),
        ],
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final FeatureTileData feature;
  const _FeatureTile(this.feature);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return BentoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(feature.icon, color: AppColors.accentStart, size: 26),
          const SizedBox(height: 14),
          Text(feature.title.of(locale), style: AppTextStyles.h3Light(size: 15.5)),
          const SizedBox(height: 6),
          Text(feature.description.of(locale), style: AppTextStyles.bodyLight(size: 13.5)),
        ],
      ),
    );
  }
}
