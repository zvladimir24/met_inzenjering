import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_locale.dart';
import 'pages/home_page.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const MetInzenjeringApp());
}

class MetInzenjeringApp extends StatefulWidget {
  const MetInzenjeringApp({super.key});

  @override
  State<MetInzenjeringApp> createState() => _MetInzenjeringAppState();
}

class _MetInzenjeringAppState extends State<MetInzenjeringApp> {
  late final LocaleController _localeController;

  @override
  void initState() {
    super.initState();
    final browserLanguage = WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    _localeController = LocaleController(browserLanguage == 'sr' ? AppLocale.sr : AppLocale.en);
  }

  @override
  void dispose() {
    _localeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppLocaleScope(
      controller: _localeController,
      child: ListenableBuilder(
        listenable: _localeController,
        builder: (context, _) {
          return MaterialApp(
            title: 'Met Inženjering Novi Sad',
            debugShowCheckedModeBanner: false,
            locale: Locale(_localeController.value.name),
            supportedLocales: const [Locale('en'), Locale('sr')],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: AppColors.lightBg,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.accentStart,
                primary: AppColors.accentStart,
              ),
              splashFactory: InkRipple.splashFactory,
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
