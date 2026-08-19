import 'package:flutter/widgets.dart';

enum AppLocale { en, sr }

/// A piece of copy in both supported languages. Widgets call [of] with the
/// currently active [AppLocale] to resolve the string to render.
class L10nText {
  final String en;
  final String sr;
  const L10nText(this.en, this.sr);

  String of(AppLocale locale) => locale == AppLocale.sr ? sr : en;
}

class LocaleController extends ValueNotifier<AppLocale> {
  LocaleController(super.initial);

  void toggle() => value = value == AppLocale.en ? AppLocale.sr : AppLocale.en;

  void set(AppLocale locale) => value = locale;
}

/// Distributes the active [AppLocale] (and the controller to change it) down
/// the widget tree. Every section resolves its copy via
/// `AppLocaleScope.localeOf(context)` inside `build()`.
class AppLocaleScope extends InheritedNotifier<LocaleController> {
  const AppLocaleScope({super.key, required LocaleController controller, required super.child})
      : super(notifier: controller);

  static LocaleController controllerOf(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppLocaleScope>();
    assert(scope != null, 'AppLocaleScope not found in context');
    return scope!.notifier!;
  }

  static AppLocale localeOf(BuildContext context) => controllerOf(context).value;
}
