import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../utils/launch_url.dart';
import '../common/bento_card.dart';
import '../common/responsive_grid.dart';
import '../common/section_header.dart';
import '../common/section_scaffold.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return SectionScaffold(
      dark: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: contactCopy.eyebrow.of(locale),
            title: contactCopy.title.of(locale),
            dark: true,
            subtitle: contactCopy.subtitle?.of(locale),
          ),
          const SizedBox(height: 40),
          ResponsiveGrid(
            desktopColumns: 4,
            tabletColumns: 2,
            mobileColumns: 1,
            children: [for (final item in contactItems) _ContactCard(item)],
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderDark),
            ),
            child: Row(
              children: [
                const Icon(Icons.verified_outlined, color: AppColors.textOnDarkSecondary, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    isoCertifiedNote.of(locale),
                    style: AppTextStyles.bodyDark(size: 13.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final ContactData item;
  const _ContactCard(this.item);

  void _handleTap() {
    switch (item.id) {
      case 'phone':
        launchPhone(item.value.en);
      case 'email':
        launchMail(item.value.en);
      case 'website':
        launchExternal(item.value.en);
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return InkWell(
      onTap: _handleTap,
      borderRadius: BorderRadius.circular(20),
      child: BentoCard(
        dark: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.accentAlpha(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Icon(item.icon, color: AppColors.accentEnd, size: 22),
            ),
            const SizedBox(height: 16),
            Text(item.label.of(locale), style: AppTextStyles.labelDark(size: 13.5)),
            const SizedBox(height: 4),
            Text(item.value.of(locale), style: AppTextStyles.bodyDark(size: 14)),
          ],
        ),
      ),
    );
  }
}
