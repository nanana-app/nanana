// Flutter imports:
// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nanana_app/src/app/d_material_app.dart';
import 'package:nanana_app/src/app/top_provider.dart';
import 'package:nanana_app/src/app/ze_stuff.dart';
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder2<SharedPreferences>(
        future: getThemPrefs(),
        builder: (_, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return ColoredBoxNanana.greyWithCircularProgressIndic;
          } else if (snap.hasError) {
            return ColoredBox(
                color: const Color.fromRGBO(92, 107, 192, 1),
                child: Text('getSharedPrefs error ${snap.error}'));
          } else if (snap.connectionState != ConnectionState.waiting &&
                  !snap.hasData ||
              snap.data == null) {
            return ColoredBox(
              color: Colors.yellow,
              child: Center(
                child: Text('${snap.error}\nsharedpref error'),
              ),
            );
          } else {
            return ChangeNotifierProvider(
              create: (_) =>
                  TopProvider(environment, appDir, packageInfo, snap.data!),
              child: const MyMaterialApp(),
            );
          }
        });
  }
}
