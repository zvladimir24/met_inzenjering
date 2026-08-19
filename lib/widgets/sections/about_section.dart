import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_text_styles.dart';
import '../common/responsive_grid.dart';
import '../common/section_header.dart';
import '../common/section_scaffold.dart';
import '../common/stat_tile.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return SectionScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: aboutCopy.eyebrow.of(locale),
            title: aboutCopy.title.of(locale),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 820),
            child: Text(
              aboutIntro.of(locale),
              style: AppTextStyles.bodyLight(size: 16),
            ),
          ),
          const SizedBox(height: 40),
          ResponsiveGrid(
            children: [for (final stat in aboutStats) StatTile(stat)],
          ),
        ],
      ),
    );
  }
}
