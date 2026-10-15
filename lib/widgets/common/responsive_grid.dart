import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

/// Lays children out in a fixed number of equal-width columns that
/// collapses at the mobile/tablet/desktop breakpoints, wrapping to new
/// rows. Every card in a row is stretched to match the tallest one in
/// that row. Used for every bento grid in the site.
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

        final rows = <Widget>[];
        for (var i = 0; i < children.length; i += columns) {
          final rowChildren = children.skip(i).take(columns).toList();
          rows.add(IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var j = 0; j < rowChildren.length; j++) ...[
                  if (j > 0) SizedBox(width: spacing),
                  SizedBox(width: itemWidth, child: rowChildren[j]),
                ],
              ],
            ),
          ));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < rows.length; i++) ...[
              if (i > 0) SizedBox(height: runSpacing),
              rows[i],
            ],
          ],
        );
      },
    );
  }
}
