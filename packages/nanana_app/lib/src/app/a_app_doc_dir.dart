// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nanana_app/src/app/b_package_info.dart';
import 'package:nanana_app/src/app/ze_stuff.dart';
import 'package:path_provider/path_provider.dart';
// iOS strange exeption on launch
// followed https://github.com/flutter/flutzter/issues/19588#issuecomment-406779390

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class AppDocDirectory extends StatelessWidget {
  final Environment environment;
  const AppDocDirectory(this.environment, {super.key});

  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    if (environment != Environment.dev) {
      playJingle();
    }

    return FutureBuilder2<Directory>(
        future: getApplicationDocumentsDirectory(),
        builder: (_, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return ColoredBoxNanana.greyWithCircularProgressIndic;
          } else if (snap.hasError) {
            print('${snap.error}');
            return ColoredBox(
                color: const Color.fromRGBO(236, 64, 122, 1),
                child: Text('appDirectory error ${snap.error}'));
          } else if ((snap.connectionState != ConnectionState.waiting &&
                  !snap.hasData) ||
              snap.data == null) {
            return ColoredBox(
              color: const Color.fromRGBO(244, 143, 177, 1),
              child: Center(
                child: Text('${snap.error}\napp directory'),
              ),
            );
          } else {
            return GetPackageInfo(environment, snap.data!);
          }
        });
  }
}
