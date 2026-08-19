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
      color: AppColors.darkBg.withValues(alpha: 0.94),
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
              icon: const Icon(Icons.menu, color: Colors.white),
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
      backgroundColor: AppColors.darkBg,
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
                    title: Text(item.label.of(locale), style: AppTextStyles.labelDark(size: 16)),
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
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
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
          style: AppTextStyles.labelDark(size: 12.5).copyWith(
            color: selected ? Colors.white : AppColors.textOnDarkSecondary,
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
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              gradient: AppColors.accentGradient,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text('M', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18)),
          ),
          const SizedBox(width: 10),
          Text('MET INŽENJERING', style: AppTextStyles.labelDark(size: 15).copyWith(letterSpacing: 0.5)),
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
      child: Text(item.label.of(locale), style: AppTextStyles.bodyDark(size: 14.5)),
    );
  }
}
