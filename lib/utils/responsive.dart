import 'package:flutter/widgets.dart';

class Responsive {
  Responsive._();

  static const double mobileMax = 600;
  static const double tabletMax = 1024;
  static const double contentMaxWidth = 1180;

  static bool isMobile(BuildContext context) => MediaQuery.sizeOf(context).width < mobileMax;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= mobileMax && width < tabletMax;
  }

  static bool isDesktop(BuildContext context) => MediaQuery.sizeOf(context).width >= tabletMax;

  /// Horizontal page padding that grows with viewport width.
  static double pagePadding(BuildContext context) {
    if (isMobile(context)) return 20;
    if (isTablet(context)) return 40;
    return 72;
  }

  static int columns(BuildContext context, {int desktop = 3, int tablet = 2, int mobile = 1}) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet;
    return desktop;
  }
}
