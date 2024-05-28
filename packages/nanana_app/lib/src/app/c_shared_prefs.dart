// Flutter imports:
// ignore_for_file: file_names
import 'dart:io';
import 'package:intl/locale.dart' as intl;
import 'package:flutter/material.dart';
import 'package:nanana_app/src/app/d_material_app.dart';
import 'package:nanana_app/src/app/top_provider.dart';
import 'package:nanana_app/src/app/ze_stuff.dart';
import 'package:nanana_app/src/shared_prefs/locale/get_locale.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsFetcher extends StatelessWidget {
  final Environment environment;
  final PackageInfo packageInfo;
  final Directory appDir;
  const SharedPrefsFetcher(this.environment, this.appDir, this.packageInfo,
      {super.key});

  Future<SharedPreferences> getThemPrefs() async =>
      await SharedPreferences.getInstance();

  // ignore: void_checks
  Future<Locale> getLocale(SharedPreferences prefs) async =>
      await LocaleGet(prefs).request([]);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder2<SharedPreferences>(
        future: getThemPrefs(),
        builder: (_, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return ColoredBoxNanana.greyWithCircularProgressIndic;
          } else if (snap.hasError ||
              (snap.connectionState != ConnectionState.waiting &&
                  !snap.hasData) ||
              snap.data == null) {
            return ColoredBox(
                color: const Color.fromRGBO(92, 107, 192, 1),
                child: Text('getSharedPrefs error ${snap.error}'));
          } else {
            return snap.data == null
                ? ChangeNotifierProvider(
                    create: (_) => TopProvider(
                        environment, appDir, packageInfo, snap.data!,
                        daPrivateLocale:
                            const Locale.fromSubtags(languageCode: 'en')),
                    child: const MyMaterialApp(),
                  )
                : FutureBuilder2<Locale>(
                    future: getLocale(snap.data!),
                    builder: (_, snapLocale) {
                      if (snap.connectionState == ConnectionState.waiting) {
                        return ColoredBoxNanana.greyWithCircularProgressIndic;
                      } else if (snapLocale.hasError ||
                          (snapLocale.connectionState !=
                                  ConnectionState.waiting &&
                              !snapLocale.hasData)) {
                        return ColoredBox(
                          color: const Color.fromRGBO(92, 107, 192, 1),
                          child: Text('getLocale error ${snap.error}'),
                        );
                      } else {
                        return ChangeNotifierProvider(
                          create: (_) => TopProvider(
                            environment,
                            appDir,
                            packageInfo,
                            snap.data!,
                            daPrivateLocale: snapLocale.data == null ||
                                    snapLocale.data!.languageCode.isEmpty
                                ? const Locale.fromSubtags(languageCode: 'en')
                                : snapLocale.data!,
                          ),
                          child: const MyMaterialApp(),
                        );
                      }
                    });
          }
        });
  }
}
