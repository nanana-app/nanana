// Dart imports:

// Package imports:

import 'dart:ui';

import 'package:nanana_app/src/shared_prefs/endpoint_base.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleGet implements EndpointBase<Locale, void> {
  final SharedPreferences sharedPrefs;
  const LocaleGet(this.sharedPrefs);

  @override
  Future<Locale> request(void _) async {
    Locale locale = const Locale.fromSubtags(languageCode: 'en');
    final languageCode = sharedPrefs.getString('locale_languageCode');

    if (languageCode != null) {
      final countryCode = sharedPrefs.getString('locale_countryCode');
      final scriptCode = sharedPrefs.getString('locale_scriptCode');
      if (countryCode != null && scriptCode != null) {
        locale = Locale.fromSubtags(
            languageCode: languageCode,
            countryCode: countryCode,
            scriptCode: scriptCode);
      }
      if (countryCode != null) {
        locale = Locale.fromSubtags(
          languageCode: languageCode,
          countryCode: countryCode,
        );
      }
      if (scriptCode != null) {
        locale = Locale.fromSubtags(
          languageCode: languageCode,
          scriptCode: scriptCode,
        );
      }
      locale = Locale.fromSubtags(languageCode: languageCode);
    }
    return locale;
  }
}
