import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../utils/responsive.dart';
import '../common/gradient_button.dart';
import '../common/placeholder_image.dart';
import '../common/section_header.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onGetQuote;
  final VoidCallback onExploreCapabilities;

  const HeroSection({super.key, required this.onGetQuote, required this.onExploreCapabilities});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    final desktop = Responsive.isDesktop(context);
    final locale = AppLocaleScope.localeOf(context);

    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [for (final badge in isoBadges) PillBadge(badge, dark: true)],
        ),
        const SizedBox(height: 24),
        Text(
          heroTitle,
          style: AppTextStyles.displayDark(size: mobile ? 34 : 52),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            heroSubtitle.of(locale),
            style: AppTextStyles.bodyDark(size: 17),
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            GradientButton(label: ctaGetQuote.of(locale), icon: Icons.arrow_forward, onPressed: onGetQuote),
            OutlineButton(label: ctaExploreCapabilities.of(locale), onPressed: onExploreCapabilities),
          ],
        ),
      ],
    );

    final visual = AspectRatio(
      aspectRatio: 1.1,
      child: PlaceholderImage(
        icon: Icons.electrical_services_outlined,
        dark: true,
        iconSize: 72,
        assetPath: 'assets/images/about/workshop_wide.png',
      ),
    );

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AppColors.darkPanelGradient),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.pagePadding(context),
        vertical: mobile ? 56 : 96,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: Responsive.contentMaxWidth),
          child: desktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 6, child: textColumn),
                    const SizedBox(width: 56),
                    Expanded(flex: 5, child: visual),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textColumn,
                    const SizedBox(height: 40),
                    visual,
                  ],
                ),
        ),
      ),
    );
  }
}
