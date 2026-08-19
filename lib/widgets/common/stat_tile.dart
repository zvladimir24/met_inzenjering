import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import 'bento_card.dart';

class StatTile extends StatelessWidget {
  final StatData data;
  final bool dark;
  const StatTile(this.data, {super.key, this.dark = false});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return BentoCard(
      dark: dark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => AppColors.accentGradient.createShader(bounds),
            child: Text(data.value.of(locale), style: AppTextStyles.statNumber(color: Colors.white)),
          ),
          const SizedBox(height: 10),
          Text(data.label.of(locale), style: dark ? AppTextStyles.labelDark(size: 15) : AppTextStyles.labelLight(size: 15)),
          const SizedBox(height: 6),
          Text(data.description.of(locale), style: dark ? AppTextStyles.bodyDark(size: 13.5) : AppTextStyles.bodyLight(size: 13.5)),
        ],
      ),
    );
  }
}
