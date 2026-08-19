import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/bento_card.dart';
import '../common/responsive_grid.dart';
import '../common/section_header.dart';
import '../common/section_scaffold.dart';

class ProductRangeSection extends StatelessWidget {
  const ProductRangeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return SectionScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: productsCopy.eyebrow.of(locale),
            title: productsCopy.title.of(locale),
            subtitle: productsCopy.subtitle?.of(locale),
          ),
          const SizedBox(height: 40),
          ResponsiveGrid(
            desktopColumns: 4,
            tabletColumns: 2,
            mobileColumns: 1,
            children: [for (final product in products) _ProductCard(product)],
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductData product;
  const _ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return BentoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: AppColors.accentGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Icon(product.icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 18),
          Text(product.title.of(locale), style: AppTextStyles.h3Light(size: 17)),
          const SizedBox(height: 8),
          Text(product.description.of(locale), style: AppTextStyles.bodyLight(size: 13.5)),
        ],
      ),
    );
  }
}
