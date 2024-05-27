import 'dart:io';

import 'package:flutter/cupertino.dart';

abstract class DirConfig {
  DirConfig._();
  static String locale = 'fr';
  static String documentPath = '';
  static String appName = '';

  static void setDocumentPath(Directory dir) {
    documentPath = dir.path;
    if (songsFilesDir.existsSync() == false) {
      Directory(songsFilesDir.path).createSync();
    }
    if (recordingsFilesDir.existsSync() == false) {
      Directory(recordingsFilesDir.path).createSync();
    }
  }

  static void setAppName(String _name) {
    appName = _name;
  }

  static Directory get songsFilesDir =>
      Directory('$documentPath${Platform.pathSeparator}nanana_songs');

  static Directory get recordingsFilesDir =>
      Directory('$documentPath${Platform.pathSeparator}nanana_recordings');

  static const double borderRadius = 27;
  static const double defaultPadding = 8;
  static GlobalKey<AnimatedListState> audioListKey =
      GlobalKey<AnimatedListState>();
}
