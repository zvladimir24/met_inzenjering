import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/bento_card.dart';
import '../common/responsive_grid.dart';
import '../common/section_header.dart';
import '../common/section_scaffold.dart';

class CapabilitiesSection extends StatelessWidget {
  const CapabilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return SectionScaffold(
      dark: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: capabilitiesCopy.eyebrow.of(locale),
            title: capabilitiesCopy.title.of(locale),
            dark: true,
            subtitle: capabilitiesCopy.subtitle?.of(locale),
          ),
          const SizedBox(height: 40),
          ResponsiveGrid(
            desktopColumns: 2,
            tabletColumns: 2,
            mobileColumns: 1,
            children: [
              _BulletCard(cuttingTechnology),
              _BulletCard(machiningForming),
            ],
          ),
        ],
      ),
    );
  }
}

class _BulletCard extends StatelessWidget {
  final BulletListData data;
  const _BulletCard(this.data);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return BentoCard(
      dark: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.title.of(locale), style: AppTextStyles.h3Dark()),
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
                  Expanded(child: Text(item.of(locale), style: AppTextStyles.bodyDark(size: 14.5))),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
