import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_text_styles.dart';
import '../common/bento_card.dart';
import '../common/responsive_grid.dart';
import '../common/section_header.dart';
import '../common/section_scaffold.dart';

// Order matches `partners` in company_data.dart: Comel, Parker Hannifin, Lohr Group.
const _partnerLogos = [
  'assets/images/partners/comel.jpeg',
  'assets/images/partners/parker_hannifin.jpeg',
  'assets/images/partners/lohr_group.jpeg',
];

class PartnersSection extends StatelessWidget {
  const PartnersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return SectionScaffold(
      dark: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: partnersCopy.eyebrow.of(locale),
            title: partnersCopy.title.of(locale),
            dark: true,
            subtitle: partnersCopy.subtitle?.of(locale),
          ),
          const SizedBox(height: 40),
          ResponsiveGrid(
            children: [
              for (var i = 0; i < partners.length; i++) _PartnerCard(partners[i], _partnerLogos[i]),
            ],
          ),
        ],
      ),
    );
  }
}

class _PartnerCard extends StatelessWidget {
  final PartnerData partner;
  final String logoAsset;
  const _PartnerCard(this.partner, this.logoAsset);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return BentoCard(
      dark: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 56,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(logoAsset, fit: BoxFit.contain, alignment: Alignment.centerLeft),
          ),
          const SizedBox(height: 18),
          Text(partner.name.of(locale), style: AppTextStyles.h3Dark(size: 18)),
          const SizedBox(height: 12),
          Text(partner.description.of(locale), style: AppTextStyles.bodyDark(size: 14)),
        ],
      ),
    );
  }
}
