import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_text_styles.dart';
import '../../utils/responsive.dart';
import '../common/bento_card.dart';
import '../common/placeholder_image.dart';
import '../common/section_header.dart';
import '../common/section_scaffold.dart';

class ProductionShowcaseSection extends StatelessWidget {
  const ProductionShowcaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final desktop = Responsive.isDesktop(context);
    final locale = AppLocaleScope.localeOf(context);

    final visual = Column(
      children: [
        AspectRatio(
          aspectRatio: 1.5,
          child: PlaceholderImage(
            icon: Icons.electrical_services_outlined,
            dark: true,
            iconSize: 64,
            assetPath: 'assets/images/production/tank_100mva_1.jpeg',
          ),
        ),
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 1.5,
          child: PlaceholderImage(
            icon: Icons.electrical_services_outlined,
            dark: true,
            iconSize: 64,
            assetPath: 'assets/images/production/tank_100mva_2.jpeg',
          ),
        ),
      ],
    );

    final specCard = BentoCard(
      dark: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tankName.of(locale), style: AppTextStyles.h3Dark()),
          const SizedBox(height: 20),
          for (final spec in tankSpecs)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(spec.label.of(locale), style: AppTextStyles.bodyDark(size: 14.5)),
                  Text(spec.value.of(locale), style: AppTextStyles.labelDark(size: 14.5)),
                ],
              ),
            ),
        ],
      ),
    );

    return SectionScaffold(
      dark: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: productionShowcaseCopy.eyebrow.of(locale),
            title: productionShowcaseCopy.title.of(locale),
            dark: true,
          ),
          const SizedBox(height: 40),
          desktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 6, child: visual),
                    const SizedBox(width: 32),
                    Expanded(flex: 4, child: specCard),
                  ],
                )
              : Column(
                  children: [
                    visual,
                    const SizedBox(height: 24),
                    specCard,
                  ],
                ),
        ],
      ),
    );
  }
}
