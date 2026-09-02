import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../utils/responsive.dart';
import 'gradient_button.dart';

class NavBar extends StatelessWidget {
  final void Function(String sectionKey) onNavTap;

  const NavBar({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final mobile = !Responsive.isDesktop(context);
    final locale = AppLocaleScope.localeOf(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        border: const Border(bottom: BorderSide(color: AppColors.borderLight)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: Responsive.pagePadding(context), vertical: 16),
      child: Row(
        children: [
          _Logo(onTap: () => onNavTap('hero')),
          const Spacer(),
          if (!mobile) ...[
            for (final item in navItems)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: _NavLink(item: item, onTap: () => onNavTap(item.sectionKey)),
              ),
            const SizedBox(width: 8),
            const LanguageToggle(),
            const SizedBox(width: 20),
            GradientButton(label: ctaGetQuote.of(locale), onPressed: () => onNavTap('contact')),
          ] else ...[
            const LanguageToggle(),
            const SizedBox(width: 4),
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.textPrimary),
              onPressed: () => _openMobileMenu(context),
            ),
          ],
        ],
      ),
    );
  }

  void _openMobileMenu(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.lightSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final item in navItems)
                  ListTile(
                    title: Text(item.label.of(locale), style: AppTextStyles.labelLight(size: 16)),
                    onTap: () {
                      Navigator.pop(sheetContext);
                      onNavTap(item.sectionKey);
                    },
                  ),
                const SizedBox(height: 12),
                GradientButton(
                  label: ctaGetQuote.of(locale),
                  onPressed: () {
                    Navigator.pop(sheetContext);
                    onNavTap('contact');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// EN / SR segmented toggle. Rebuilds itself via [AppLocaleScope]'s
/// [ListenableBuilder] wrapper at the app root, so no local state needed.
class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AppLocaleScope.controllerOf(context);
    final current = controller.value;
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppColors.lightBg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LangOption(label: 'EN', selected: current == AppLocale.en, onTap: () => controller.set(AppLocale.en)),
          _LangOption(label: 'SR', selected: current == AppLocale.sr, onTap: () => controller.set(AppLocale.sr)),
        ],
      ),
    );
  }
}

class _LangOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _LangOption({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          gradient: selected ? AppColors.accentGradient : null,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: AppTextStyles.labelLight(size: 12.5).copyWith(
            color: selected ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  final VoidCallback onTap;
  const _Logo({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/logo/met_inzenjering_icon.png', height: 32),
          const SizedBox(width: 10),
          Text('MET INŽENJERING', style: AppTextStyles.labelLight(size: 15).copyWith(letterSpacing: 0.5)),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final NavItem item;
  final VoidCallback onTap;
  const _NavLink({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return InkWell(
      onTap: onTap,
      child: Text(item.label.of(locale), style: AppTextStyles.bodyLight(size: 14.5)),
    );
  }
}
