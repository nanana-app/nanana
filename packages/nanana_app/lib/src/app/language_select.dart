import 'package:fl_language_picker/language_locale.dart';
import 'package:fl_language_picker/language_picker.dart';
import 'package:flutter/material.dart';
import 'package:nanana_app/src/app/d_material_app.dart';
import 'package:nanana_app/src/app/top_provider.dart';
import 'package:nanana_app/src/shared_prefs/locale/save_locale.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSelectWidget extends StatefulWidget {
  /// FAB is displayed in app first init only with no appBar
  final bool isFirstScreen;

  const LanguageSelectWidget({required this.isFirstScreen, super.key});

  @override
  State<LanguageSelectWidget> createState() => _LanguageSelectWidgetState();
}

class _LanguageSelectWidgetState extends State<LanguageSelectWidget> {
  Language _selectedLanguage = Language.empty;
  List<Locale> supportedLocales = locales;

  @override
  void initState() {
    super.initState();
    final top = Provider.of<TopProvider>(context, listen: false);

    // final locale = PlatformDispatcher.instance.locale;
    if (Languages.defaultLanguages.any((e) => e.locale == top.locale)) {
      _selectedLanguage =
          Languages.defaultLanguages.firstWhere((e) => e.locale == top.locale);
    } else {
      _selectedLanguage = Language.empty;
    }
  }

  void _openLanguagePickerDialog(List<Locale> supportedLocales) => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context),
          child: LanguagePickerDialog(
            // searchCursorColor: Colors.pinkAccent,
            locales: supportedLocales,
            searchInputDecoration:
                InputDecoration(icon: const Icon(Icons.search)),
            isSearchable: true,
            title: const Text(''), //const Icon(Icons.translate, size: 44),
            onValuePicked: (Language language) async {
              setState(() => _selectedLanguage = language);
              final top = Provider.of<TopProvider>(context, listen: false);
              await LocaleSave(top.prefs).request(_selectedLanguage.locale);
              top.setLocale(_selectedLanguage.locale);
              if (widget.isFirstScreen == false) {}
            },
            itemBuilder: (language) => LanguageWidget(language),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isFirstScreen ? null : AppBar(),
      // floatingActionButton:
      //     widget.isFirstScreen && _selectedLanguage != Language.empty
      //         ? FloatingActionButton(
      //             backgroundColor: Colors.blueGrey,
      //             child: const Icon(Icons.arrow_forward, color: Colors.white),
      //             onPressed: () {
      //               Navigator.of(context).push(
      //                 MaterialPageRoute(
      //                   builder: (context) => const GoSomewhere(),
      //                 ),
      //               );
      //             })
      //         : null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => _openLanguagePickerDialog(supportedLocales),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                child: const Icon(Icons.translate, size: 51),
              ),
            ),
            const SizedBox(height: 18),
            GestureDetector(
              onTap: () => _openLanguagePickerDialog(supportedLocales),
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
