import 'dart:io';

import 'package:flutter/material.dart';

import 'package:nanana_app/src/app/ze_stuff.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopProvider extends ChangeNotifier {
  Directory songsFilesDir, recordingsFilesDir;
  TopProvider(
    this._environment,
    this._appDirectoryPrivate,
    this.packageInfo,
    this.prefs, {
    required this.daPrivateLocale,
  })  : songsFilesDir = Directory(
            '${_appDirectoryPrivate.path}${Platform.pathSeparator}nanana_songs'),
        recordingsFilesDir = Directory(
            '${_appDirectoryPrivate.path}${Platform.pathSeparator}nanana_recordings');

  Locale daPrivateLocale;
  Locale get locale => daPrivateLocale;
  void setLocale(Locale lolo) {
    daPrivateLocale = lolo;
    // setFormatter();
    notifyListeners();
  }

  // ignore: unused_field
  final Directory _appDirectoryPrivate;
  final SharedPreferences prefs;

  void createFolders() {
    if (songsFilesDir.existsSync() == false) {
      Directory(songsFilesDir.path).createSync();
    }
    if (recordingsFilesDir.existsSync() == false) {
      Directory(recordingsFilesDir.path).createSync();
    }
  }

  PackageInfo packageInfo;
  String get appVersion => packageInfo.version;

  int get appBuildInt => packageInfo.buildNumber.isEmpty
      ? 0
      : int.tryParse(packageInfo.buildNumber) ?? 0;

  Environment _environment;
  Environment get environment => _environment;
  void setEnvironment(Environment val) {
    if (val != _environment) {
      _environment = val;
      notifyListeners();
    }
  }
}
