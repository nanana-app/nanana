import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:languages_dart/export.dart';
import 'package:language_picker/export.dart';

import 'package:nanana_app/src/app/l10n.dart';
import 'package:nanana_app/src/app/top_provider.dart';
import 'package:nanana_app/src/shared_prefs/locale/save_locale.dart';

class LanguageSelectWidget extends StatefulWidget {
  const LanguageSelectWidget({super.key});

  @override
  State<LanguageSelectWidget> createState() => _LanguageSelectWidgetState();
}

class _LanguageSelectWidgetState extends State<LanguageSelectWidget> {
  Language _selectedLanguage = Language.empty;

  @override
  void initState() {
    super.initState();
    final top = Provider.of<TopProvider>(context, listen: false);
    if (Languages.defaultLanguages.any((e) => e.localeIntl == top.locale)) {
      _selectedLanguage = Languages.defaultLanguages
          .firstWhere((e) => e.localeIntl == top.locale);
    } else {
      _selectedLanguage = Language.empty;
    }
  }

  void _openLanguagePickerDialog(List<Locale> supportedLocalesFlutter) =>
      showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context),
          child: LanguagePickerDialog(
            // searchCursorColor: Colors.pinkAccent,
            locales: supportedLocalesFlutter,
            searchInputDecoration:
                const InputDecoration(icon: Icon(Icons.search)),
            isSearchable: true,
            title: const Text(''), //const Icon(Icons.translate, size: 44),
            onValuePicked: (Language language) async {
              setState(() => _selectedLanguage = language);
              final top = Provider.of<TopProvider>(context, listen: false);
              final localeFlutter = Locale.fromSubtags(
                  languageCode:
                      _selectedLanguage.localeIntl.locale.languageCode,
                  scriptCode: _selectedLanguage.localeIntl.locale.scriptCode,
                  countryCode: _selectedLanguage.localeIntl.locale.countryCode);
              await LocaleSave(top.prefs).request(localeFlutter);
              top.setLocale(localeFlutter);
            },
            itemBuilder: (language) => LanguageWidget(language),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => _openLanguagePickerDialog(LocalesSupported.locales),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(18, 18, 18, 18),
                child: Icon(Icons.translate, size: 51),
              ),
            ),
            const SizedBox(height: 18),
            GestureDetector(
              onTap: () => _openLanguagePickerDialog(LocalesSupported.locales),
              child: Text(_selectedLanguage.name,
                  style: Theme.of(context).textTheme.displayMedium),
            ),
            const SizedBox(height: 9),
            Text(
              _selectedLanguage.nameEn == _selectedLanguage.name
                  ? ''
                  : _selectedLanguage.nameEn,
              style: Theme.of(context).textTheme.displaySmall,
            )
          ],
        ),
      ),
    );
  }
}
