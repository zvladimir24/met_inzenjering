import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/common/nav_bar.dart';
import '../widgets/common/site_footer.dart';
import '../widgets/sections/about_section.dart';
import '../widgets/sections/ada_facility_section.dart';
import '../widgets/sections/capabilities_section.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/sections/facilities_section.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/logistics_section.dart';
import '../widgets/sections/metallurgy_section.dart';
import '../widgets/sections/partners_section.dart';
import '../widgets/sections/product_range_section.dart';
import '../widgets/sections/production_gallery_section.dart';
import '../widgets/sections/production_showcase_section.dart';
import '../widgets/sections/quality_control_section.dart';
import '../widgets/sections/technical_details_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final Map<String, GlobalKey> _sectionKeys = {
    'hero': GlobalKey(),
    'about': GlobalKey(),
    'capabilities': GlobalKey(),
    'facilities': GlobalKey(),
    'products': GlobalKey(),
    'partners': GlobalKey(),
    'quality': GlobalKey(),
    'contact': GlobalKey(),
  };

  void _scrollToSection(String key) {
    final targetContext = _sectionKeys[key]?.currentContext;
    if (targetContext == null) return;
    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      body: Column(
        children: [
          NavBar(onNavTap: _scrollToSection),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  KeyedSubtree(
                    key: _sectionKeys['hero'],
                    child: HeroSection(
                      onGetQuote: () => _scrollToSection('contact'),
                      onExploreCapabilities: () => _scrollToSection('capabilities'),
                    ),
                  ),
                  KeyedSubtree(key: _sectionKeys['about'], child: const AboutSection()),
                  KeyedSubtree(key: _sectionKeys['capabilities'], child: const CapabilitiesSection()),
                  KeyedSubtree(key: _sectionKeys['facilities'], child: const FacilitiesSection()),
                  KeyedSubtree(key: _sectionKeys['products'], child: const ProductRangeSection()),
                  KeyedSubtree(key: _sectionKeys['partners'], child: const PartnersSection()),
                  const TechnicalDetailsSection(),
                  KeyedSubtree(key: _sectionKeys['quality'], child: const QualityControlSection()),
                  const LogisticsSection(),
                  const AdaFacilitySection(),
                  const ProductionShowcaseSection(),
                  const ProductionGallerySection(),
                  const MetallurgySection(),
                  KeyedSubtree(key: _sectionKeys['contact'], child: const ContactSection()),
                  const SiteFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
