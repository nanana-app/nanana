import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as fgen;

extension AppLocalizationsX on BuildContext {
  fgen.AppLocalizations get l10n => fgen.AppLocalizations.of(this);
}
