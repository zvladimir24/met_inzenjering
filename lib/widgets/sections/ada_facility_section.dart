import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../utils/launch_url.dart';
import '../../utils/responsive.dart';
import '../common/bento_card.dart';
import '../common/gradient_button.dart';
import '../common/placeholder_image.dart';
import '../common/responsive_grid.dart';
import '../common/section_header.dart';
import '../common/section_scaffold.dart';

class AdaFacilitySection extends StatelessWidget {
  const AdaFacilitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final desktop = Responsive.isDesktop(context);
    final locale = AppLocaleScope.localeOf(context);

    final visual = Column(
      children: [
        AspectRatio(
          aspectRatio: 1.6,
          child: PlaceholderImage(
            icon: Icons.warehouse_outlined,
            iconSize: 56,
            assetPath: 'assets/images/ada/interior_hall.jpeg',
          ),
        ),
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 1.6,
          child: PlaceholderImage(
            icon: Icons.terrain_outlined,
            iconSize: 56,
            assetPath: 'assets/images/ada/aerial_drone.jpeg',
          ),
        ),
      ],
    );

    final infoColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InfoBlock(title: adaOwnershipTitle.of(locale), body: adaOwnershipBody.of(locale)),
        const SizedBox(height: 20),
        _InfoBlock(title: adaStrategicTitle.of(locale), body: adaStrategicBody.of(locale)),
        const SizedBox(height: 28),
        GradientButton(
          label: ctaWatchDroneVideo.of(locale),
          icon: Icons.play_circle_outline,
          onPressed: () => launchExternal(adaVideoUrl),
        ),
      ],
    );

    return SectionScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: adaCopy.eyebrow.of(locale),
            title: adaCopy.title.of(locale),
            subtitle: adaCopy.subtitle?.of(locale),
          ),
          const SizedBox(height: 40),
          desktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: visual),
                    const SizedBox(width: 32),
                    Expanded(flex: 5, child: infoColumn),
                  ],
                )
              : Column(
                  children: [
                    visual,
                    const SizedBox(height: 28),
                    infoColumn,
                  ],
                ),
          const SizedBox(height: 32),
          ResponsiveGrid(
            desktopColumns: 4,
            tabletColumns: 2,
            mobileColumns: 2,
            children: [for (final stat in adaStats) _AdaStat(stat)],
          ),
        ],
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String title;
  final String body;
  const _InfoBlock({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.h3Light(size: 16)),
        const SizedBox(height: 6),
        Text(body, style: AppTextStyles.bodyLight(size: 14.5)),
      ],
    );
  }
}

class _AdaStat extends StatelessWidget {
  final StatData stat;
  const _AdaStat(this.stat);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return BentoCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => AppColors.accentGradient.createShader(bounds),
            child: Text(stat.value.of(locale), style: AppTextStyles.statNumber(size: 28, color: Colors.white)),
          ),
          const SizedBox(height: 6),
          Text(stat.label.of(locale), style: AppTextStyles.labelLight(size: 13.5)),
          Text(stat.description.of(locale), style: AppTextStyles.bodyLight(size: 12)),
        ],
      ),
    );
  }
}
