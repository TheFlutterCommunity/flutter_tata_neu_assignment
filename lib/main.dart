import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tata_neu_assignment/core/constants/constants.dart';
import 'package:flutter_tata_neu_assignment/core/constants/prefs_constants.dart';
import 'package:flutter_tata_neu_assignment/core/di/locator.dart';
import 'package:flutter_tata_neu_assignment/core/localization/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_tata_neu_assignment/core/persistence/prefs_helper.dart';
import 'package:flutter_tata_neu_assignment/core/routing/router.dart';
import 'package:flutter_tata_neu_assignment/core/routing/routes.dart';
import 'package:flutter_tata_neu_assignment/ui/res/themes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  PrefsHelper.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    Provider.debugCheckInvalidValueType = null;
    runApp(const TataNeuApp());
  });
}

class TataNeuApp extends StatefulWidget {
  const TataNeuApp({Key? key}) : super(key: key);

  @override
  State<TataNeuApp> createState() => _TataNeuAppState();

  static State? of(BuildContext context) =>
      context.findAncestorStateOfType<_TataNeuAppState>();
}

class _TataNeuAppState extends State<TataNeuApp> {
  Locale? _locale;

  @override
  void initState() {
    _getLangCode();
    super.initState();
  }

  // ignore: unused_element
  Future<void> _getLangCode() async {
    final languageCode = await PrefsHelper.getString(langCode, langCodeEN);
    _locale = Locale(languageCode);
    setState(() {});
  }

  void setLocale(Locale value) {
    PrefsHelper.setString(langCode, value.languageCode);
    if (kDebugMode) {
      print('setLocale:: ${value.languageCode}');
    }
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: appTheme,
      locale: _locale ?? const Locale(langCodeEN, ''),
      supportedLocales: const [
        Locale(langCodeEN, ''),
        Locale(langCodeHI, ''),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: PageRouter.generateRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
