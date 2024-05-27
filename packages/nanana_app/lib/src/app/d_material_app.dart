import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanana_app/src/app/language_select.dart';
// Flutter imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as fgen;
import 'package:fl_country_code_picker/fl_country_code_picker.dart' as flc;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nanana_app/src/app/top_provider.dart';
import 'package:nanana_app/src/editor/transcribe.dart';
import 'package:nanana_app/src/home.dart';
import 'package:nanana_app/src/player/player.dart';
import 'package:provider/provider.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    final top = Provider.of<TopProvider>(context, listen: false);
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      locale: Locale(top.locale.languageCode),
      localizationsDelegates: const [
        fgen.AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        flc.CountryLocalizations.delegate,
        FallbackLocalizationDelegate(),
        FallbackLocalizationDelegateCup(),
      ],
      supportedLocales: locales,
      navigatorObservers: [],
      title: 'Nanana',
      theme: ThemeData.light(useMaterial3: true),
      //showSemanticsDebugger: widget.environment ==Environment.test,
      //debugShowMaterialGrid: widget.environment ==Environment.test,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => const Scaffold(
              body: Center(
            child: Text('unknownRoute'),
          )),
        );
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

/// Quick Fix
class FallbackLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackLocalizationDelegate();
  @override
  bool isSupported(Locale locale) => true;
  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      const DefaultMaterialLocalizations();
  @override
  bool shouldReload(_) => false;
}

// quick fix suite
class FallbackLocalizationDelegateCup
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackLocalizationDelegateCup();
  @override
  bool isSupported(Locale locale) => true;
  @override
  Future<CupertinoLocalizations> load(Locale locale) async =>
      const DefaultCupertinoLocalizations();
  @override
  bool shouldReload(_) => false;
}

const locales = [
  Locale('fr'),
  Locale('en'),
  Locale('iu'),
  Locale('fil'),
  Locale('af'),
  Locale('am'),
  Locale('ar'),
  Locale('az'),
  Locale('bg'),
  Locale('bn'),
  Locale('bs'),
  Locale('ca'),
  Locale('cs'),
  Locale('da'),
  Locale('de'),
  Locale('el'),
  Locale('es'),
  Locale('et'),
  Locale('fa'),
  Locale('fi'),
  Locale('gl'),
  Locale('ha'),
  Locale('he'),
  Locale('hi'),
  Locale('hr'),
  Locale('ht'),
  Locale('hu'),
  Locale('hy'),
  Locale('id'),
  Locale('is'),
  Locale('it'),
  Locale('ja'),
  Locale('ka'),
  Locale('kk'),
  Locale('km'),
  Locale('ko'),
  Locale('ku'),
  Locale('ky'),
  Locale('lt'),
  Locale('lv'),
  Locale('mk'),
  Locale('ml'),
  Locale.fromSubtags(languageCode: 'mn', scriptCode: 'Mong'),
  Locale('ms'),
  Locale('my'),
  Locale('nb'),
  Locale('nl'),
  Locale('ne'),
  Locale('no'),
  Locale('pl'),
  Locale('ps'),
  Locale('pt'),
  Locale('ro'),
  Locale('ru'),
  Locale('sd'),
  Locale('sk'),
  Locale('sl'),
  Locale('so'),
  Locale('sq'),
  Locale('sr'),
  Locale('sv'),
  Locale('ta'),
  Locale('th'),
  Locale('tr'),
  Locale('tt'),
  Locale('ug'),
  Locale('uk'),
  Locale('ur'),
  Locale('uz'),
  Locale('vi'),
  Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
];
