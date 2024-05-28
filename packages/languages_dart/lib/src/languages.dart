import 'package:intl/locale.dart';

class Language {
  const Language(this.locale, this.nameEn, this.name);

  final Locale? locale;
  final String nameEn;
  final String name;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nameEn': nameEn,
      'locale': locale.toString(), // == toLanguageTag()
    };
  }

  Language.fromMap(Map<String, String> map)
      : nameEn = map['nameEn']!,
        locale = Locale.fromSubtags(languageCode: map['locale']!),
        name = map['name']!;

  static final empty = Language(null, '', '');

  /// Returns the Language matching the given ISO code from the standard list.
  factory Language.fromIsoCode(String code) =>
      Languages.defaultLanguages.firstWhere((l) => l.locale == code);

  bool operator ==(o) =>
      o is Language && nameEn == o.nameEn && locale == o.locale;

  @override
  int get hashCode => locale.hashCode;
}

class Languages {
  static Language get afrikaans => Language(
      Locale.fromSubtags(languageCode: 'af'), 'Afrikaans', 'Afrikaans');
  static Language get albanian =>
      Language(Locale.fromSubtags(languageCode: 'sq'), 'Albanian', 'Shqip');
  static Language get amharic =>
      Language(Locale.fromSubtags(languageCode: 'am'), 'Amharic', 'አማርኛ');
  static Language get arabic =>
      Language(Locale.fromSubtags(languageCode: 'ar'), 'Arabic', 'العربية');
  static Language get armenian =>
      Language(Locale.fromSubtags(languageCode: 'hy'), 'Armenian', 'Հայերեն');
  static Language get assamese =>
      Language(Locale.fromSubtags(languageCode: 'as'), 'Assamese', 'অসমীয়া');
  static Language get azerbaijaniLatin => Language(
      Locale.fromSubtags(languageCode: 'az'),
      'Azerbaijani (Latin)',
      'Azərbaycan dili');
  static Language get bambara => Language(
      Locale.fromSubtags(languageCode: 'bm'),
      'Bambara',
      'Bambara'); // TODO check native
  static Language get bangla =>
      Language(Locale.fromSubtags(languageCode: 'bn'), 'Bangla', 'বাংলা');
  static Language get bashkir => Language(
      Locale.fromSubtags(languageCode: 'ba'), 'Bashkir', 'башҡорт теле');
  static Language get basque =>
      Language(Locale.fromSubtags(languageCode: 'eu'), 'Basque', 'Euskara');
  static Language get bhojpuri =>
      Language(Locale.fromSubtags(languageCode: 'bho'), 'Bhojpuri', 'भोजपुरी');
  static Language get bodo =>
      Language(Locale.fromSubtags(languageCode: 'brx'), 'Bodo', 'बरʼ ');
  static Language get bosnianLatin => Language(
      Locale.fromSubtags(languageCode: 'bs'),
      'Bosnian (Latin)',
      'Bosanski jezik');
  static Language get bulgarian => Language(
      Locale.fromSubtags(languageCode: 'bg'), 'Bulgarian', 'български език');
  static Language get cantoneseTraditional => Language(
      Locale.fromSubtags(languageCode: 'yue'), 'Cantonese (Traditional)', '粵語');
  static Language get catalan =>
      Language(Locale.fromSubtags(languageCode: 'ca'), 'Catalan', 'Català');
  static Language get chineseLiterary => Language(
      Locale.fromSubtags(languageCode: 'lzh'), 'Chinese (Literary)', '中文');
  static Language get chineseSimplified => Language(
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      'Chinese Simplified',
      '简化字');
  static Language get chineseTraditional => Language(
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
      'Chinese Traditional',
      '簡化字');
  static Language get chiShona =>
      Language(Locale.fromSubtags(languageCode: 'sn'), 'chiShona', 'chiShona');
  static Language get croatian =>
      Language(Locale.fromSubtags(languageCode: 'hr'), 'Croatian', 'Hrvatski');
  static Language get czech => Language(
      Locale.fromSubtags(languageCode: 'cs'), 'Czech', 'Česky / čeština');
  static Language get danish =>
      Language(Locale.fromSubtags(languageCode: 'da'), 'Danish', 'Dansk');
  static Language get dari =>
      Language(Locale.fromSubtags(languageCode: 'prs'), 'Dari', '');
  static Language get divehi =>
      Language(Locale.fromSubtags(languageCode: 'dv'), 'Divehi', 'ދިވެހި');
  static Language get dogri =>
      Language(Locale.fromSubtags(languageCode: 'doi'), 'Dogri', '');
  static Language get dutch =>
      Language(Locale.fromSubtags(languageCode: 'nl'), 'Dutch', 'Nederlands');
  static Language get english =>
      Language(Locale.fromSubtags(languageCode: 'en'), 'English', 'English');
  static Language get estonian => Language(
      Locale.fromSubtags(languageCode: 'et'), 'Estonian', 'Eesti keel');
  static Language get faroese =>
      Language(Locale.fromSubtags(languageCode: 'fo'), 'Faroese', 'Føroyskt');
  static Language get fijian => Language(
      Locale.fromSubtags(languageCode: 'fj'), 'Fijian', 'Vosa Vakaviti');
  static Language get filipino =>
      Language(Locale.fromSubtags(languageCode: 'fil'), 'Filipino', 'Tagalog');
  static Language get finnish => Language(
      Locale.fromSubtags(languageCode: 'fi'), 'Finnish', 'Suomen kieli');
  static Language get french =>
      Language(Locale.fromSubtags(languageCode: 'fr'), 'French', 'Français');
  static Language get frenchCanada => Language(
      Locale.fromSubtags(languageCode: 'fr-ca'),
      'French (Canada)',
      'Québécois');
  static Language get galician =>
      Language(Locale.fromSubtags(languageCode: 'gl'), 'Galician', 'Galego');
  static Language get georgian =>
      Language(Locale.fromSubtags(languageCode: 'ka'), 'Georgian', 'ქართული');
  static Language get german =>
      Language(Locale.fromSubtags(languageCode: 'de'), 'German', 'Deutsch');
  static Language get greek =>
      Language(Locale.fromSubtags(languageCode: 'el'), 'Greek', 'Ελληνικά');
  static Language get gujarati =>
      Language(Locale.fromSubtags(languageCode: 'gu'), 'Gujarati', 'ગુજરાતી');
  static Language get haitianCreole => Language(
      Locale.fromSubtags(languageCode: 'ht'),
      'Haitian Creole',
      'Kreyòl ayisyen');
  static Language get hausa =>
      Language(Locale.fromSubtags(languageCode: 'ha'), 'Hausa', 'هَوُسَ');
  static Language get hebrew =>
      Language(Locale.fromSubtags(languageCode: 'he'), 'Hebrew', 'עברית');
  static Language get hindi => Language(
      Locale.fromSubtags(languageCode: 'hi'), 'Hindi', 'हिन्दी / हिंदी');
  static Language get hmongDawLatin => Language(
      Locale.fromSubtags(languageCode: 'mww'), 'Hmong Daw (Latin)', '');
  static Language get hungarian =>
      Language(Locale.fromSubtags(languageCode: 'hu'), 'Hungarian', 'magyar');
  static Language get icelandic =>
      Language(Locale.fromSubtags(languageCode: 'is'), 'Icelandic', 'Íslenska');
  static Language get igbo =>
      Language(Locale.fromSubtags(languageCode: 'ig'), 'Igbo', 'Igbo');
  static Language get indonesian => Language(
      Locale.fromSubtags(languageCode: 'id'), 'Indonesian', 'Bahasa Indonesia');
  static Language get inuinnaqtun =>
      Language(Locale.fromSubtags(languageCode: 'ikt'), 'Inuinnaqtun', '');
  static Language get inuktitut =>
      Language(Locale.fromSubtags(languageCode: 'iu'), 'Inuktitut', 'ᐃᓄᒃᑎᑐᑦ');
  static Language get inuktitutLatin => Language(
      Locale.fromSubtags(languageCode: 'iu', scriptCode: 'Latn'),
      'Inuktitut (Latin)',
      '');

  static Language get irish =>
      Language(Locale.fromSubtags(languageCode: 'ga'), 'Irish', 'Gaeilge');
  static Language get italian =>
      Language(Locale.fromSubtags(languageCode: 'it'), 'Italian', 'Italiano');
  static Language get japanese => Language(
      Locale.fromSubtags(languageCode: 'ja'), 'Japanese', '日本語 (にほんご)');
  static Language get kannada =>
      Language(Locale.fromSubtags(languageCode: 'kn'), 'Kannada', 'ಕನ್ನಡ');
  static Language get kashmiri => Language(
      Locale.fromSubtags(languageCode: 'ks'), 'Kashmiri', 'कश्मीरी / كشميري');
  static Language get kazakh =>
      Language(Locale.fromSubtags(languageCode: 'kk'), 'Kazakh', 'Қазақ тілі');
  static Language get khmer =>
      Language(Locale.fromSubtags(languageCode: 'km'), 'Khmer', 'ភាសាខ្មែរ');
  static Language get kinyarwanda => Language(
      Locale.fromSubtags(languageCode: 'rw'), 'Kinyarwanda', 'Kinyarwanda');
  static Language get klingon => Language(
      Locale.fromSubtags(languageCode: 'tlh', scriptCode: 'Latn'),
      'Klingon',
      '');
  static Language get klingonPlqaD => Language(
      Locale.fromSubtags(languageCode: 'tlh', scriptCode: 'Piqd'),
      'Klingon (plqaD)',
      '');

  static Language get konkani =>
      Language(Locale.fromSubtags(languageCode: 'gom'), 'Konkani', '');
  static Language get korean => Language(Locale.fromSubtags(languageCode: 'ko'),
      'Korean', '한국어 (韓國語) / 조선말 (朝鮮語)');
  static Language get kurdishCentral => Language(
      Locale.fromSubtags(languageCode: 'ku'),
      'Kurdish (Central)',
      'Kurdî / كوردی');
  static Language get kurdishNorthern => Language(
      Locale.fromSubtags(languageCode: 'kmr'),
      'Kurdish (Northern)',
      'Kurdî / كوردی');
  static Language get kyrgyzCyrillic => Language(
      Locale.fromSubtags(languageCode: 'ky'),
      'Kyrgyz (Cyrillic)',
      'кыргыз тили');
  static Language get lao =>
      Language(Locale.fromSubtags(languageCode: 'lo'), 'Lao', 'ພາສາລາວ');
  static Language get latvian => Language(
      Locale.fromSubtags(languageCode: 'lv'), 'Latvian', 'Latviešu valoda');
  static Language get lithuanian => Language(
      Locale.fromSubtags(languageCode: 'lt'), 'Lithuanian', 'Lietuvių kalba');
  static Language get lingala =>
      Language(Locale.fromSubtags(languageCode: 'ln'), 'Lingala', 'Lingála');
  static Language get lowerSorbian =>
      Language(Locale.fromSubtags(languageCode: 'dsb'), 'Lower Sorbian', '');
  static Language get luganda =>
      Language(Locale.fromSubtags(languageCode: 'lug'), 'Luganda', '');
  static Language get macedonian => Language(
      Locale.fromSubtags(languageCode: 'mk'), 'Macedonian', 'македонски јазик');
  static Language get maithili =>
      Language(Locale.fromSubtags(languageCode: 'mai'), 'Maithili', '');
  static Language get malagasy => Language(
      Locale.fromSubtags(languageCode: 'mg'), 'Malagasy', 'Fiteny malagasy');
  static Language get malayLatin => Language(
      Locale.fromSubtags(languageCode: 'ms'),
      'Malay (Latin)',
      'Bahasa Melayu / بهاس ملايو');
  static Language get malayalam =>
      Language(Locale.fromSubtags(languageCode: 'ml'), 'Malayalam', 'മലയാളം');
  static Language get maltese =>
      Language(Locale.fromSubtags(languageCode: 'mt'), 'Maltese', 'Malti');
  static Language get maori =>
      Language(Locale.fromSubtags(languageCode: 'mi'), 'Maori', 'Te reo Māori');
  static Language get marathi =>
      Language(Locale.fromSubtags(languageCode: 'mr'), 'Marathi', 'मराठी');
  static Language get mongolianCyrillic => Language(
      Locale.fromSubtags(languageCode: 'mn', scriptCode: 'Cyrl'),
      'Mongolian (Cyrillic)',
      'монгол хэл');
  static Language get mongolianTraditional => Language(
      Locale.fromSubtags(languageCode: 'mn', scriptCode: 'Mong'),
      'Mongolian (Traditional)',
      'ᠮᠣᠩᠭᠣᠯ ᠬᠡᠯᠡ');
  static Language get myanmar =>
      Language(Locale.fromSubtags(languageCode: 'my'), 'Myanmar', 'ဗမာစာ');
  static Language get nepali =>
      Language(Locale.fromSubtags(languageCode: 'ne'), 'Nepali', 'नेपाली');
  static Language get norwegian => Language(
      Locale.fromSubtags(languageCode: 'nb'), 'Norwegian', 'Norsk bokmål');
  static Language get nyanja =>
      Language(Locale.fromSubtags(languageCode: 'nya'), 'Nyanja', '');
  static Language get odia =>
      Language(Locale.fromSubtags(languageCode: 'or'), 'Odia', 'ଓଡ଼ିଆ');
  static Language get pashto =>
      Language(Locale.fromSubtags(languageCode: 'ps'), 'Pashto', 'پښتو');
  static Language get persian =>
      Language(Locale.fromSubtags(languageCode: 'fa'), 'Persian', '');
  static Language get polish =>
      Language(Locale.fromSubtags(languageCode: 'pl'), 'Polish', 'Polski');
  static Language get portugueseBrazil => Language(
      Locale.fromSubtags(languageCode: 'pt'),
      'Portuguese (Brazil)',
      'Português');
  static Language get portuguesePortugal => Language(
      Locale.fromSubtags(languageCode: 'pt-pt'),
      'Portuguese (Portugal)',
      'Português');
  static Language get punjabi => Language(
      Locale.fromSubtags(languageCode: 'pa'), 'Punjabi', 'ਪੰਜਾਬੀ ; پنجابی');
  static Language get queretaroOtomi =>
      Language(Locale.fromSubtags(languageCode: 'otq'), 'Queretaro Otomi', '');
  static Language get romanian =>
      Language(Locale.fromSubtags(languageCode: 'ro'), 'Romanian', 'Română');
  static Language get rundi =>
      Language(Locale.fromSubtags(languageCode: 'run'), 'Rundi', '');
  static Language get russian => Language(
      Locale.fromSubtags(languageCode: 'ru'), 'Russian', 'русский язык');
  static Language get samoanLatin => Language(
      Locale.fromSubtags(languageCode: 'sm'),
      'Samoan (Latin)',
      'Gagana fa\'a Samoa');
  static Language get serbianCyrillic => Language(
      Locale.fromSubtags(languageCode: 'sr', scriptCode: 'Cyrl'),
      'Serbian (Cyrillic)',
      'српски');
  static Language get serbianLatin => Language(
      Locale.fromSubtags(languageCode: 'sr', scriptCode: 'Latn'),
      'Serbian (Latin)',
      'srpski');
  static Language get sesotho =>
      Language(Locale.fromSubtags(languageCode: 'st'), 'Sesotho', 'seSotho');
  static Language get sesothoSaLeboa =>
      Language(Locale.fromSubtags(languageCode: 'nso'), 'Sesotho sa Leboa', '');
  static Language get setswana =>
      Language(Locale.fromSubtags(languageCode: 'tn'), 'Setswana', 'seTswana');
  static Language get sindhi => Language(
      Locale.fromSubtags(languageCode: 'sd'), 'Sindhi', 'सिन्धी / سنڌي، سندھی');
  static Language get sinhala =>
      Language(Locale.fromSubtags(languageCode: 'si'), 'Sinhala', 'සිංහල');
  static Language get slovak =>
      Language(Locale.fromSubtags(languageCode: 'sk'), 'Slovak', 'Slovenčina');
  static Language get slovenian => Language(
      Locale.fromSubtags(languageCode: 'sl'), 'Slovenian', 'Slovenščina');
  static Language get somaliArabic => Language(
      Locale.fromSubtags(languageCode: 'so'),
      'Somali (Arabic)',
      'Soomaaliga / af Soomaali');
  static Language get spanish =>
      Language(Locale.fromSubtags(languageCode: 'es'), 'Spanish', 'Español');
  static Language get swahiliLatin => Language(
      Locale.fromSubtags(languageCode: 'sw'), 'Swahili (Latin)', 'Kiswahili');
  static Language get swedish =>
      Language(Locale.fromSubtags(languageCode: 'sv'), 'Swedish', 'Svenska');
  static Language get tahitian => Language(
      Locale.fromSubtags(languageCode: 'ty'), 'Tahitian', 'Reo Mā`ohi');
  static Language get tamil =>
      Language(Locale.fromSubtags(languageCode: 'ta'), 'Tamil', 'தமிழ்');
  static Language get tatarLatin => Language(
      Locale.fromSubtags(languageCode: 'tt'),
      'Tatar (Latin)',
      'татарча / tatarça / تاتارچا');
  static Language get telugu =>
      Language(Locale.fromSubtags(languageCode: 'te'), 'Telugu', 'తెలుగు');
  static Language get thai =>
      Language(Locale.fromSubtags(languageCode: 'th'), 'Thai', 'ไทย');
  static Language get tibetan =>
      Language(Locale.fromSubtags(languageCode: 'bo'), 'Tibetan', '');
  static Language get tigrinya =>
      Language(Locale.fromSubtags(languageCode: 'ti'), 'Tigrinya', 'ትግርኛ');
  static Language get tongan =>
      Language(Locale.fromSubtags(languageCode: 'to'), 'Tongan', 'faka Tonga');
  static Language get turkish =>
      Language(Locale.fromSubtags(languageCode: 'tr'), 'Turkish', 'Türkçe');
  static Language get turkmenLatin => Language(
      Locale.fromSubtags(languageCode: 'tk'),
      'Turkmen (Latin)',
      'Türkmen / Түркмен');
  static Language get ukrainian => Language(
      Locale.fromSubtags(languageCode: 'uk'), 'Ukrainian', 'українська мова');
  static Language get upperSorbian =>
      Language(Locale.fromSubtags(languageCode: 'hsb'), 'Upper Sorbian', '');
  static Language get urdu =>
      Language(Locale.fromSubtags(languageCode: 'ur'), 'Urdu', 'اردو');
  static Language get uyghurArabic => Language(
      Locale.fromSubtags(languageCode: 'ug'),
      'Uyghur (Arabic)',
      'Uyƣurqə ; ئۇيغۇرچ');
  static Language get uzbekLatin => Language(
      Locale.fromSubtags(languageCode: 'uz'),
      'Uzbek (Latin)',
      'O\'zbek / Ўзбек / أۇزبېك');
  static Language get vietnamese => Language(
      Locale.fromSubtags(languageCode: 'vi'), 'Vietnamese', 'Tiếng Việt');
  static Language get welsh =>
      Language(Locale.fromSubtags(languageCode: 'cy'), 'Welsh', 'Cymraeg');
  static Language get xhosa =>
      Language(Locale.fromSubtags(languageCode: 'xh'), 'Xhosa', 'isiXhosa');
  static Language get yoruba =>
      Language(Locale.fromSubtags(languageCode: 'yo'), 'Yoruba', 'Yorùbá');
  static Language get yucatecMaya => Language(
      Locale.fromSubtags(languageCode: 'yua'), 'Yucatec Maya', 'Maya t\'aan');
  static Language get zulu =>
      Language(Locale.fromSubtags(languageCode: 'zu'), 'Zulu', 'isiZulu');

  // TODO : exact native name needs to be completed
  // TODO : local to be double checked
  static Language get abkhazian => Language(
      Locale.fromSubtags(languageCode: 'ab'), 'Abkhazian', 'Abkhazian');
  static Language get afar =>
      Language(Locale.fromSubtags(languageCode: 'aa'), 'Afar', 'Afar');
  static Language get akan =>
      Language(Locale.fromSubtags(languageCode: 'ak'), 'Akan', 'Akan');
  static Language get aragonese => Language(
      Locale.fromSubtags(languageCode: 'an'), 'Aragonese', 'Aragonese');
  static Language get avaric =>
      Language(Locale.fromSubtags(languageCode: 'av'), 'Avaric', 'Avaric');
  static Language get avestan =>
      Language(Locale.fromSubtags(languageCode: 'ae'), 'Avestan', 'Avestan');
  static Language get aymara =>
      Language(Locale.fromSubtags(languageCode: 'ay'), 'Aymara', 'Aymara');
  static Language get azerbaijani => Language(
      Locale.fromSubtags(languageCode: 'az'), 'Azerbaijani', 'Azerbaijani');
  static Language get belarusian => Language(
      Locale.fromSubtags(languageCode: 'be'), 'Belarusian', 'Belarusian');
  static Language get bengali =>
      Language(Locale.fromSubtags(languageCode: 'bn'), 'Bengali', 'Bengali');
  static Language get bihariLanguages => Language(
      Locale.fromSubtags(languageCode: 'bh'),
      'Bihari Languages',
      'Bihari Languages');
  static Language get bislama =>
      Language(Locale.fromSubtags(languageCode: 'bi'), 'Bislama', 'Bislama');
  static Language get bosnian =>
      Language(Locale.fromSubtags(languageCode: 'bs'), 'Bosnian', 'Bosnian');
  static Language get breton =>
      Language(Locale.fromSubtags(languageCode: 'br'), 'Breton', 'Breton');
  static Language get burmese =>
      Language(Locale.fromSubtags(languageCode: 'my'), 'Burmese', 'Burmese');
  static Language get centralKhmer => Language(
      Locale.fromSubtags(languageCode: 'km'), 'Central Khmer', 'Central Khmer');
  static Language get chamorro =>
      Language(Locale.fromSubtags(languageCode: 'ch'), 'Chamorro', 'Chamorro');
  static Language get chechen =>
      Language(Locale.fromSubtags(languageCode: 'ce'), 'Chechen', 'Chechen');
  static Language get chewaNyanja => Language(
      Locale.fromSubtags(languageCode: 'ny'),
      'Chewa (Nyanja)',
      'Chewa (Nyanja)');
  static Language get churchSlavonic => Language(
      Locale.fromSubtags(languageCode: 'cu'),
      'Church Slavonic',
      'Church Slavonic');
  static Language get chuvash =>
      Language(Locale.fromSubtags(languageCode: 'cv'), 'Chuvash', 'Chuvash');
  static Language get cornish =>
      Language(Locale.fromSubtags(languageCode: 'kw'), 'Cornish', 'Cornish');
  static Language get corsican =>
      Language(Locale.fromSubtags(languageCode: 'co'), 'Corsican', 'Corsican');
  static Language get cree =>
      Language(Locale.fromSubtags(languageCode: 'cr'), 'Cree', 'Cree');
  static Language get dhivehi =>
      Language(Locale.fromSubtags(languageCode: 'dv'), 'Dhivehi', 'Dhivehi');
  static Language get dzongkha =>
      Language(Locale.fromSubtags(languageCode: 'dz'), 'Dzongkha', 'Dzongkha');
  static Language get esperanto => Language(
      Locale.fromSubtags(languageCode: 'eo'), 'Esperanto', 'Esperanto');
  static Language get ewe =>
      Language(Locale.fromSubtags(languageCode: 'ee'), 'Ewe', 'Ewe');
  static Language get fulah =>
      Language(Locale.fromSubtags(languageCode: 'ff'), 'Fulah', 'Fulah');
  static Language get gaelic =>
      Language(Locale.fromSubtags(languageCode: 'gd'), 'Gaelic', 'Gaelic');
  static Language get ganda =>
      Language(Locale.fromSubtags(languageCode: 'lg'), 'Ganda', 'Ganda');
  static Language get guarani =>
      Language(Locale.fromSubtags(languageCode: 'gn'), 'Guarani', 'Guarani');
  static Language get haitian =>
      Language(Locale.fromSubtags(languageCode: 'ht'), 'Haitian', 'Haitian');
  static Language get herero =>
      Language(Locale.fromSubtags(languageCode: 'hz'), 'Herero', 'Herero');
  static Language get hiriMotu => Language(
      Locale.fromSubtags(languageCode: 'ho'), 'Hiri Motu', 'Hiri Motu');
  static Language get ido =>
      Language(Locale.fromSubtags(languageCode: 'io'), 'Ido', 'Ido');
  static Language get interlingua => Language(
      Locale.fromSubtags(languageCode: 'ia'), 'Interlingua', 'Interlingua');
  static Language get interlingue => Language(
      Locale.fromSubtags(languageCode: 'ie'), 'Interlingue', 'Interlingue');
  static Language get inupiaq =>
      Language(Locale.fromSubtags(languageCode: 'ik'), 'Inupiaq', 'Inupiaq');
  static Language get kalaallisut => Language(
      Locale.fromSubtags(languageCode: 'kl'), 'Kalaallisut', 'Kalaallisut');
  static Language get kanuri =>
      Language(Locale.fromSubtags(languageCode: 'kr'), 'Kanuri', 'Kanuri');
  static Language get kikuyu =>
      Language(Locale.fromSubtags(languageCode: 'ki'), 'Kikuyu', 'Kikuyu');
  static Language get kirghiz =>
      Language(Locale.fromSubtags(languageCode: 'ky'), 'Kirghiz', 'Kirghiz');
  static Language get komi =>
      Language(Locale.fromSubtags(languageCode: 'kv'), 'Komi', 'Komi');
  static Language get kongo =>
      Language(Locale.fromSubtags(languageCode: 'kg'), 'Kongo', 'Kongo');
  static Language get kuanyama =>
      Language(Locale.fromSubtags(languageCode: 'kj'), 'Kuanyama', 'Kuanyama');
  static Language get kurdish =>
      Language(Locale.fromSubtags(languageCode: 'ku'), 'Kurdish', 'Kurdish');
  static Language get latin =>
      Language(Locale.fromSubtags(languageCode: 'la'), 'Latin', 'Latin');
  static Language get limburgan => Language(
      Locale.fromSubtags(languageCode: 'li'), 'Limburgan', 'Limburgan');
  static Language get lubaKatanga => Language(
      Locale.fromSubtags(languageCode: 'lu'), 'Luba-Katanga', 'Luba-Katanga');
  static Language get luxembourgish => Language(
      Locale.fromSubtags(languageCode: 'lb'), 'Luxembourgish', 'Luxembourgish');
  static Language get malay =>
      Language(Locale.fromSubtags(languageCode: 'ms'), 'Malay', 'Malay');
  static Language get manx =>
      Language(Locale.fromSubtags(languageCode: 'gv'), 'Manx', 'Manx');
  static Language get marshallese => Language(
      Locale.fromSubtags(languageCode: 'mh'), 'Marshallese', 'Marshallese');
  static Language get mongolian => Language(
      Locale.fromSubtags(languageCode: 'mn'), 'Mongolian', 'Mongolian');
  static Language get nauru =>
      Language(Locale.fromSubtags(languageCode: 'na'), 'Nauru', 'Nauru');
  static Language get navajo =>
      Language(Locale.fromSubtags(languageCode: 'nv'), 'Navajo', 'Navajo');
  static Language get ndebeleNorth => Language(
      Locale.fromSubtags(languageCode: 'nd'),
      'Ndebele, North',
      'Ndebele, North');
  static Language get ndebeleSouth => Language(
      Locale.fromSubtags(languageCode: 'nr'),
      'Ndebele, South',
      'Ndebele, South');
  static Language get ndonga =>
      Language(Locale.fromSubtags(languageCode: 'ng'), 'Ndonga', 'Ndonga');
  static Language get northernSami => Language(
      Locale.fromSubtags(languageCode: 'se'), 'Northern Sami', 'Northern Sami');
  static Language get norwegianNynorsk => Language(
      Locale.fromSubtags(languageCode: 'nn'),
      'Norwegian Nynorsk',
      'Norwegian Nynorsk');
  static Language get occitan =>
      Language(Locale.fromSubtags(languageCode: 'oc'), 'Occitan', 'Occitan');
  static Language get ojibwa =>
      Language(Locale.fromSubtags(languageCode: 'oj'), 'Ojibwa', 'Ojibwa');
  static Language get oriya =>
      Language(Locale.fromSubtags(languageCode: 'or'), 'Oriya', 'Oriya');
  static Language get oromo =>
      Language(Locale.fromSubtags(languageCode: 'om'), 'Oromo', 'Oromo');
  static Language get ossetian =>
      Language(Locale.fromSubtags(languageCode: 'os'), 'Ossetian', 'Ossetian');
  static Language get pali =>
      Language(Locale.fromSubtags(languageCode: 'pi'), 'Pali', 'Pali');
  static Language get panjabi =>
      Language(Locale.fromSubtags(languageCode: 'pa'), 'Panjabi', 'Panjabi');
  static Language get portuguese => Language(
      Locale.fromSubtags(languageCode: 'pt'), 'Portuguese', 'Portuguese');
  static Language get pushto =>
      Language(Locale.fromSubtags(languageCode: 'ps'), 'Pushto', 'Pushto');
  static Language get quechua =>
      Language(Locale.fromSubtags(languageCode: 'qu'), 'Quechua', 'Quechua');
  static Language get romansh =>
      Language(Locale.fromSubtags(languageCode: 'rm'), 'Romansh', 'Romansh');
  static Language get samoan =>
      Language(Locale.fromSubtags(languageCode: 'sm'), 'Samoan', 'Samoan');
  static Language get sango =>
      Language(Locale.fromSubtags(languageCode: 'sg'), 'Sango', 'Sango');
  static Language get sanskrit =>
      Language(Locale.fromSubtags(languageCode: 'sa'), 'Sanskrit', 'Sanskrit');
  static Language get sardinian => Language(
      Locale.fromSubtags(languageCode: 'sc'), 'Sardinian', 'Sardinian');
  static Language get serbian =>
      Language(Locale.fromSubtags(languageCode: 'sr'), 'Serbian', 'Serbian');
  static Language get shona =>
      Language(Locale.fromSubtags(languageCode: 'sn'), 'Shona', 'Shona');
  static Language get sichuanYi => Language(
      Locale.fromSubtags(languageCode: 'ii'), 'Sichuan Yi', 'Sichuan Yi');
  static Language get somali =>
      Language(Locale.fromSubtags(languageCode: 'so'), 'Somali', 'Somali');
  static Language get sothoSouthern => Language(
      Locale.fromSubtags(languageCode: 'st'),
      'Sotho, Southern',
      'Sotho, Southern');
  static Language get sundanese => Language(
      Locale.fromSubtags(languageCode: 'su'), 'Sundanese', 'Sundanese');
  static Language get swahili =>
      Language(Locale.fromSubtags(languageCode: 'sw'), 'Swahili', 'Swahili');
  static Language get swati =>
      Language(Locale.fromSubtags(languageCode: 'ss'), 'Swati', 'Swati');
  static Language get tagalog =>
      Language(Locale.fromSubtags(languageCode: 'tl'), 'Tagalog', 'Tagalog');
  static Language get tajik =>
      Language(Locale.fromSubtags(languageCode: 'tg'), 'Tajik', 'Tajik');
  static Language get tatar =>
      Language(Locale.fromSubtags(languageCode: 'tt'), 'Tatar', 'Tatar');
  static Language get tongaTongaIslands => Language(
      Locale.fromSubtags(languageCode: 'to'),
      'Tonga (Tonga Islands)',
      'Tonga (Tonga Islands)');
  static Language get tsonga =>
      Language(Locale.fromSubtags(languageCode: 'ts'), 'Tsonga', 'Tsonga');
  static Language get tswana =>
      Language(Locale.fromSubtags(languageCode: 'tn'), 'Tswana', 'Tswana');
  static Language get turkmen =>
      Language(Locale.fromSubtags(languageCode: 'tk'), 'Turkmen', 'Turkmen');
  static Language get twi =>
      Language(Locale.fromSubtags(languageCode: 'tw'), 'Twi', 'Twi');
  static Language get uighur =>
      Language(Locale.fromSubtags(languageCode: 'ug'), 'Uighur', 'Uighur');
  static Language get uzbek =>
      Language(Locale.fromSubtags(languageCode: 'uz'), 'Uzbek', 'Uzbek');
  static Language get venda =>
      Language(Locale.fromSubtags(languageCode: 've'), 'Venda', 'Venda');
  static Language get volapuk =>
      Language(Locale.fromSubtags(languageCode: 'vo'), 'Volapük', 'Volapük');
  static Language get walloon =>
      Language(Locale.fromSubtags(languageCode: 'wa'), 'Walloon', 'Walloon');
  static Language get westernFrisian => Language(
      Locale.fromSubtags(languageCode: 'fy'),
      'Western Frisian',
      'Western Frisian');
  static Language get wolof =>
      Language(Locale.fromSubtags(languageCode: 'wo'), 'Wolof', 'Wolof');
  static Language get yiddish =>
      Language(Locale.fromSubtags(languageCode: 'yi'), 'Yiddish', 'Yiddish');
  static Language get zhuang =>
      Language(Locale.fromSubtags(languageCode: 'za'), 'Zhuang', 'Zhuang');

  static List<Language> defaultLanguages = [
    Languages.abkhazian,
    Languages.afar,
    Languages.afrikaans,
    Languages.akan,
    Languages.albanian,
    Languages.amharic,
    Languages.arabic,
    Languages.aragonese,
    Languages.armenian,
    Languages.assamese,
    Languages.avaric,
    Languages.avestan,
    Languages.aymara,
    Languages.azerbaijani,
    Languages.bambara,
    Languages.bashkir,
    Languages.basque,
    Languages.belarusian,
    Languages.bengali,
    Languages.bihariLanguages,
    Languages.bislama,
    Languages.bosnian,
    Languages.breton,
    Languages.bulgarian,
    Languages.burmese,
    Languages.catalan,
    Languages.centralKhmer,
    Languages.chamorro,
    Languages.chechen,
    Languages.chewaNyanja,
    Languages.chineseSimplified,
    Languages.chineseTraditional,
    Languages.churchSlavonic,
    Languages.chuvash,
    Languages.cornish,
    Languages.corsican,
    Languages.cree,
    Languages.croatian,
    Languages.czech,
    Languages.danish,
    Languages.dhivehi,
    Languages.dutch,
    Languages.dzongkha,
    Languages.english,
    Languages.esperanto,
    Languages.estonian,
    Languages.ewe,
    Languages.faroese,
    Languages.fijian,
    Languages.finnish,
    Languages.french,
    Languages.fulah,
    Languages.gaelic,
    Languages.galician,
    Languages.ganda,
    Languages.georgian,
    Languages.german,
    Languages.greek,
    Languages.guarani,
    Languages.gujarati,
    Languages.haitian,
    Languages.hausa,
    Languages.hebrew,
    Languages.herero,
    Languages.hindi,
    Languages.hiriMotu,
    Languages.hungarian,
    Languages.icelandic,
    Languages.ido,
    Languages.igbo,
    Languages.indonesian,
    Languages.interlingua,
    Languages.interlingue,
    Languages.inuktitut,
    Languages.inupiaq,
    Languages.irish,
    Languages.italian,
    Languages.japanese,
    Languages.kalaallisut,
    Languages.kannada,
    Languages.kanuri,
    Languages.kashmiri,
    Languages.kazakh,
    Languages.kikuyu,
    Languages.kinyarwanda,
    Languages.kirghiz,
    Languages.komi,
    Languages.kongo,
    Languages.korean,
    Languages.kuanyama,
    Languages.kurdish,
    Languages.lao,
    Languages.latin,
    Languages.latvian,
    Languages.limburgan,
    Languages.lingala,
    Languages.lithuanian,
    Languages.lubaKatanga,
    Languages.luxembourgish,
    Languages.macedonian,
    Languages.malagasy,
    Languages.malay,
    Languages.malayalam,
    Languages.maltese,
    Languages.manx,
    Languages.maori,
    Languages.marathi,
    Languages.marshallese,
    Languages.mongolian,
    Languages.nauru,
    Languages.navajo,
    Languages.ndebeleNorth,
    Languages.ndebeleSouth,
    Languages.ndonga,
    Languages.nepali,
    Languages.northernSami,
    Languages.norwegian,
    Languages.norwegianNynorsk,
    Languages.occitan,
    Languages.ojibwa,
    Languages.oriya,
    Languages.oromo,
    Languages.ossetian,
    Languages.pali,
    Languages.panjabi,
    Languages.persian,
    Languages.polish,
    Languages.portuguese,
    Languages.pushto,
    Languages.quechua,
    Languages.romanian,
    Languages.romansh,
    Languages.rundi,
    Languages.russian,
    Languages.samoan,
    Languages.sango,
    Languages.sanskrit,
    Languages.sardinian,
    Languages.serbian,
    Languages.shona,
    Languages.sichuanYi,
    Languages.sindhi,
    Languages.sinhala,
    Languages.slovak,
    Languages.slovenian,
    Languages.somali,
    Languages.sothoSouthern,
    Languages.spanish,
    Languages.sundanese,
    Languages.swahili,
    Languages.swati,
    Languages.swedish,
    Languages.tagalog,
    Languages.tahitian,
    Languages.tajik,
    Languages.tamil,
    Languages.tatar,
    Languages.telugu,
    Languages.thai,
    Languages.tibetan,
    Languages.tigrinya,
    Languages.tongaTongaIslands,
    Languages.tsonga,
    Languages.tswana,
    Languages.turkish,
    Languages.turkmen,
    Languages.twi,
    Languages.uighur,
    Languages.ukrainian,
    Languages.urdu,
    Languages.uzbek,
    Languages.venda,
    Languages.vietnamese,
    Languages.volapuk,
    Languages.walloon,
    Languages.welsh,
    Languages.westernFrisian,
    Languages.wolof,
    Languages.xhosa,
    Languages.yiddish,
    Languages.yoruba,
    Languages.zhuang,
    Languages.zulu
  ];
}
