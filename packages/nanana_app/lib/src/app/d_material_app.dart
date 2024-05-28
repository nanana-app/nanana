import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Flutter imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as fgen;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nanana_app/src/app/l10n.dart';
import 'package:nanana_app/src/app/top_provider.dart';
import 'package:nanana_app/src/home.dart';
import 'package:provider/provider.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    final top =
        Provider.of<TopProvider>(context, listen: false); // ? pass it to true

    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      locale: Locale(top.locale.languageCode),
      localizationsDelegates: const [
        fgen.AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackLocalizationDelegate(),
        FallbackLocalizationDelegateCup(),
      ],
      supportedLocales: LocalesSupported.locales,
      title: 'Nanana',
      theme: ThemeData.light(useMaterial3: true),
      //showSemanticsDebugger: widget.environment ==Environment.test,
      //debugShowMaterialGrid: widget.environment ==Environment.test,
      debugShowCheckedModeBanner: false,
      home: const TranscriptionsView(),
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
