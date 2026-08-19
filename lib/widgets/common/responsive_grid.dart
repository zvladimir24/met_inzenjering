import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

/// Lays children out in a fixed number of equal-width columns that
/// collapses at the mobile/tablet/desktop breakpoints, wrapping to new
/// rows. Used for every bento grid in the site.
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final int desktopColumns;
  final int tabletColumns;
  final int mobileColumns;
  final double spacing;
  final double runSpacing;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.desktopColumns = 3,
    this.tabletColumns = 2,
    this.mobileColumns = 1,
    this.spacing = 24,
    this.runSpacing = 24,
  });

  @override
  Widget build(BuildContext context) {
    final columns = Responsive.columns(
      context,
      desktop: desktopColumns,
      tablet: tabletColumns,
      mobile: mobileColumns,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalSpacing = spacing * (columns - 1);
        final itemWidth = (constraints.maxWidth - totalSpacing) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: runSpacing,
          children: [
            for (final child in children)
              SizedBox(width: itemWidth, child: child),
          ],
        );
      },
    );
  }
}
