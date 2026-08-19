import 'package:flutter/material.dart';
import '../common/placeholder_image.dart';
import '../common/responsive_grid.dart';
import '../common/section_scaffold.dart';

const _galleryPhotos = [
  ('assets/images/production/finished_tank_1.jpeg', Icons.electrical_services_outlined),
  ('assets/images/production/painting_process.jpeg', Icons.format_paint_outlined),
  ('assets/images/production/conservator_tube.jpeg', Icons.circle_outlined),
  ('assets/images/production/finished_tank_2.jpeg', Icons.warehouse_outlined),
];

class ProductionGallerySection extends StatelessWidget {
  const ProductionGallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionScaffold(
      child: ResponsiveGrid(
        desktopColumns: 4,
        tabletColumns: 2,
        mobileColumns: 1,
        children: [
          for (final (assetPath, icon) in _galleryPhotos)
            AspectRatio(
              aspectRatio: 1.1,
              child: PlaceholderImage(icon: icon, iconSize: 40, assetPath: assetPath),
            ),
        ],
      ),
    );
  }
}
