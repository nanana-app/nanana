// Dart imports:
import 'dart:ui';
// Flutter imports:
import 'package:flutter/services.dart';
import 'package:nanana_app/src/shared_prefs/endpoint_base.dart';
// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class LocaleSave implements EndpointBase<bool, Locale> {
  final SharedPreferences _sharedPrefs;
  const LocaleSave(this._sharedPrefs);

  @override
  Future<bool> request(Locale locale, {bool isTest = false}) async {
    try {
      if (locale.countryCode != null) {
        await _sharedPrefs.setString('locale_countryCode', locale.countryCode!);
      }
      if (locale.scriptCode != null) {
        await _sharedPrefs.setString('locale_scriptCode', locale.scriptCode!);
      }
      return await _sharedPrefs.setString(
          'locale_languageCode', locale.languageCode);
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}
