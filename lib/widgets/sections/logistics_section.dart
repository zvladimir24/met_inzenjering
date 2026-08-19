import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/bento_card.dart';
import '../common/responsive_grid.dart';
import '../common/section_header.dart';
import '../common/section_scaffold.dart';

class LogisticsSection extends StatelessWidget {
  const LogisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return SectionScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: logisticsCopy.eyebrow.of(locale),
            title: logisticsCopy.title.of(locale),
          ),
          const SizedBox(height: 40),
          ResponsiveGrid(
            desktopColumns: 2,
            tabletColumns: 2,
            mobileColumns: 1,
            children: [
              _PointsCard(surfacePrepHeading, surfacePrepPoints),
              _PointsCard(logisticsHeading, logisticsPoints),
            ],
          ),
        ],
      ),
    );
  }
}

class _PointsCard extends StatelessWidget {
  final L10nText title;
  final List<L10nText> points;
  const _PointsCard(this.title, this.points);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return BentoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.of(locale), style: AppTextStyles.h3Light()),
          const SizedBox(height: 18),
          for (final point in points)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 7, right: 12),
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      gradient: AppColors.accentGradient,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(child: Text(point.of(locale), style: AppTextStyles.bodyLight(size: 14.5))),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
