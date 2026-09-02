import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../common/placeholder_image.dart';
import '../common/responsive_grid.dart';
import '../common/section_header.dart';
import '../common/section_scaffold.dart';

const _metallurgyPhotos = [
  ('assets/images/metallurgy/pipes_bundle.jpeg', Icons.linear_scale_outlined),
  ('assets/images/metallurgy/coils_1.jpeg', Icons.donut_large_outlined),
  ('assets/images/metallurgy/coils_2.jpeg', Icons.donut_small_outlined),
  ('assets/images/metallurgy/square_tubes.jpeg', Icons.view_module_outlined),
  ('assets/images/metallurgy/laser_cutting_machine.jpeg', Icons.precision_manufacturing_outlined),
  ('assets/images/metallurgy/press_bending.jpeg', Icons.handyman_outlined),
  ('assets/images/metallurgy/coil_uncoiler.jpeg', Icons.settings_outlined),
];

class MetallurgySection extends StatelessWidget {
  const MetallurgySection({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return SectionScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: metallurgyCopy.eyebrow.of(locale),
            title: metallurgyCopy.title.of(locale),
          ),
          const SizedBox(height: 40),
          ResponsiveGrid(
            desktopColumns: 4,
            tabletColumns: 3,
            mobileColumns: 2,
            children: [
              for (var i = 0; i < _metallurgyPhotos.length; i++)
                AspectRatio(
                  aspectRatio: 1,
                  child: PlaceholderImage(
                    icon: _metallurgyPhotos[i].$2,
                    borderRadius: 16,
                    iconSize: 32,
                    assetPath: _metallurgyPhotos[i].$1,
                    revealDelay: Duration(milliseconds: 70 * (i % 4)),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
