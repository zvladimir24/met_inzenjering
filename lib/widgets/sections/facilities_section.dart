import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/bento_card.dart';
import '../common/responsive_grid.dart';
import '../common/section_header.dart';
import '../common/section_scaffold.dart';

class FacilitiesSection extends StatelessWidget {
  const FacilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return SectionScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: facilitiesCopy.eyebrow.of(locale),
            title: facilitiesCopy.title.of(locale),
            subtitle: facilitiesCopy.subtitle?.of(locale),
          ),
          const SizedBox(height: 40),
          ResponsiveGrid(
            desktopColumns: 2,
            tabletColumns: 2,
            mobileColumns: 1,
            children: [
              _FacilityCard(productionFacilities),
              _FacilityCard(surfaceTreatmentRooms),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: AppColors.accentGradient,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              facilitiesHighlight.of(locale),
              style: AppTextStyles.h3Dark(size: 16).copyWith(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}

class _FacilityCard extends StatelessWidget {
  final BulletListData data;
  const _FacilityCard(this.data);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return BentoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.title.of(locale), style: AppTextStyles.h3Light()),
          const SizedBox(height: 18),
          for (final item in data.items)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
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
                  Expanded(child: Text(item.of(locale), style: AppTextStyles.bodyLight(size: 14.5))),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
