import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../utils/responsive.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    final locale = AppLocaleScope.localeOf(context);
    return Container(
      width: double.infinity,
      color: AppColors.darkBg,
      padding: EdgeInsets.symmetric(horizontal: Responsive.pagePadding(context), vertical: 24),
      child: Column(
        children: [
          Divider(color: AppColors.borderDark),
          const SizedBox(height: 20),
          Flex(
            direction: mobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: mobile ? CrossAxisAlignment.center : CrossAxisAlignment.center,
            children: [
              Text(footerCopyright.of(locale), style: AppTextStyles.bodyDark(size: 13)),
              if (mobile) const SizedBox(height: 10),
              Text('ISO 9001 · ISO 14001 · ISO 3834-3', style: AppTextStyles.bodyDark(size: 13)),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
