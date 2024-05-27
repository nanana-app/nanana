// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nanana_app/src/app/c_shared_prefs.dart';
import 'package:nanana_app/src/app/ze_stuff.dart';

import 'package:package_info_plus/package_info_plus.dart';

//Calling to PackageInfo.fromPlatform() before the runApp() call will cause an exception.
class GetPackageInfo extends StatelessWidget {
  final Environment environment;
  final Directory appDir;
  GetPackageInfo(this.environment, this.appDir, {Key? key}) {
    key = key;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder2<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (_, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return ColoredBoxNanana.greyWithCircularProgressIndic;
          } else if (snap.hasError) {
            print('${snap.error}');
            return ColoredBox(
                color: const Color.fromRGBO(236, 64, 122, 1),
                child: Text('packageInfo error ${snap.error}'));
          } else if (snap.connectionState != ConnectionState.waiting &&
              !snap.hasData) {
            return ColoredBox(
                color: const Color.fromRGBO(244, 143, 177, 1),
                child: Center(
                  child: Text('${snap.error}\npackage info'),
                ));
          } else {
            return SharedPrefsFetcher(environment, appDir, snap.data!);
          }
        });
  }
}
