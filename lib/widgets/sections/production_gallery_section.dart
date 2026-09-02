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
          for (var i = 0; i < _galleryPhotos.length; i++)
            AspectRatio(
              aspectRatio: 1.1,
              child: PlaceholderImage(
                icon: _galleryPhotos[i].$2,
                iconSize: 40,
                assetPath: _galleryPhotos[i].$1,
                revealDelay: Duration(milliseconds: 90 * i),
              ),
            ),
        ],
      ),
    );
  }
}
