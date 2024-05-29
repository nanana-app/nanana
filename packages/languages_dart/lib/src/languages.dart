import 'package:intl/locale.dart';

class LocaleIntl {
  final Locale locale;
  const LocaleIntl(this.locale);
}

class Language {
  const Language(this.localeIntl, this.nameEn, this.name);

  final LocaleIntl localeIntl;
  final String nameEn;
  final String name;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nameEn': nameEn,
      'localeIntl': localeIntl.toString(), // == toLanguageTag()
    };
  }

  Language.fromMap(Map<String, String> map)
      : nameEn = map['nameEn']!,
        localeIntl =
            LocaleIntl(Locale.fromSubtags(languageCode: map['localeIntl']!)),
        name = map['name']!;

  static final empty =
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'zzz')), '', '');

  /// Returns the Language matching the given ISO code from the standard list.
  factory Language.fromIsoCode(String code) =>
      Languages.defaultLanguages.firstWhere((l) => l.localeIntl == code);

  bool operator ==(o) =>
      o is Language && nameEn == o.nameEn && localeIntl == o.localeIntl;

  @override
  int get hashCode => localeIntl.hashCode;
}

class Languages {
  static Language get afrikaans => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'af')),
      'Afrikaans',
      'Afrikaans');
  static Language get albanian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'sq')), 'Albanian', 'Shqip');
  static Language get amharic => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'am')), 'Amharic', 'አማርኛ');
  static Language get arabic => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ar')), 'Arabic', 'العربية');
  static Language get armenian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'hy')),
      'Armenian',
      'Հայերեն');
  static Language get assamese => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'as')),
      'Assamese',
      'অসমীয়া');
  static Language get azerbaijaniLatin => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'az')),
      'Azerbaijani (Latin)',
      'Azərbaycan dili');
  static Language get bambara => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'bm')),
      'Bambara',
      'Bambara'); // TODO check native
  static Language get bangla => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'bn')), 'Bangla', 'বাংলা');
  static Language get bashkir => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ba')),
      'Bashkir',
      'башҡорт теле');
  static Language get basque => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'eu')), 'Basque', 'Euskara');
  static Language get bhojpuri => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'bho')),
      'Bhojpuri',
      'भोजपुरी');
  static Language get bodo => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'brx')), 'Bodo', 'बरʼ ');
  static Language get bosnianLatin => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'bs')),
      'Bosnian (Latin)',
      'Bosanski jezik');
  static Language get bulgarian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'bg')),
      'Bulgarian',
      'български език');
  static Language get cantoneseTraditional => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'yue')),
      'Cantonese (Traditional)',
      '粵語');
  static Language get catalan => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ca')), 'Catalan', 'Català');
  static Language get chineseLiterary => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'lzh')),
      'Chinese (Literary)',
      '中文');
  static Language get chineseSimplified => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans')),
      'Chinese Simplified',
      '简化字');
  static Language get chineseTraditional => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')),
      'Chinese Traditional',
      '簡化字');
  static Language get chiShona => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'sn')),
      'chiShona',
      'chiShona');
  static Language get croatian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'hr')),
      'Croatian',
      'Hrvatski');
  static Language get czech => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'cs')),
      'Czech',
      'Česky / čeština');
  static Language get danish => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'da')), 'Danish', 'Dansk');
  static Language get dari =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'prs')), 'Dari', '');
  static Language get divehi => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'dv')), 'Divehi', 'ދިވެހި');
  static Language get dogri => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'doi')), 'Dogri', '');
  static Language get dutch => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'nl')),
      'Dutch',
      'Nederlands');
  static Language get english => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'en')), 'English', 'English');
  static Language get estonian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'et')),
      'Estonian',
      'Eesti keel');
  static Language get faroese => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'fo')),
      'Faroese',
      'Føroyskt');
  static Language get fijian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'fj')),
      'Fijian',
      'Vosa Vakaviti');
  static Language get filipino => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'fil')),
      'Filipino',
      'Tagalog');
  static Language get finnish => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'fi')),
      'Finnish',
      'Suomen kieli');
  static Language get french => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'fr')), 'French', 'Français');
  static Language get frenchCanada => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'fr-ca')),
      'French (Canada)',
      'Québécois');
  static Language get galician => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'gl')), 'Galician', 'Galego');
  static Language get georgian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ka')),
      'Georgian',
      'ქართული');
  static Language get german => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'de')), 'German', 'Deutsch');
  static Language get greek => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'el')), 'Greek', 'Ελληνικά');
  static Language get gujarati => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'gu')),
      'Gujarati',
      'ગુજરાતી');
  static Language get haitianCreole => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ht')),
      'Haitian Creole',
      'Kreyòl ayisyen');
  static Language get hausa => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ha')), 'Hausa', 'هَوُسَ');
  static Language get hebrew => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'he')), 'Hebrew', 'עברית');
  static Language get hindi => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'hi')),
      'Hindi',
      'हिन्दी / हिंदी');
  static Language get hmongDawLatin => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'mww')),
      'Hmong Daw (Latin)',
      '');
  static Language get hungarian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'hu')),
      'Hungarian',
      'magyar');
  static Language get icelandic => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'is')),
      'Icelandic',
      'Íslenska');
  static Language get igbo => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ig')), 'Igbo', 'Igbo');
  static Language get indonesian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'id')),
      'Indonesian',
      'Bahasa Indonesia');
  static Language get inuinnaqtun => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ikt')), 'Inuinnaqtun', '');
  static Language get inuktitut => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'iu')),
      'Inuktitut',
      'ᐃᓄᒃᑎᑐᑦ');
  static Language get inuktitutLatin => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'iu', scriptCode: 'Latn')),
      'Inuktitut (Latin)',
      '');

  static Language get irish => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ga')), 'Irish', 'Gaeilge');
  static Language get italian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'it')),
      'Italian',
      'Italiano');
  static Language get japanese => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ja')),
      'Japanese',
      '日本語 (にほんご)');
  static Language get kannada => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'kn')), 'Kannada', 'ಕನ್ನಡ');
  static Language get kashmiri => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ks')),
      'Kashmiri',
      'कश्मीरी / كشميري');
  static Language get kazakh => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'kk')),
      'Kazakh',
      'Қазақ тілі');
  static Language get khmer => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'km')), 'Khmer', 'ភាសាខ្មែរ');
  static Language get kinyarwanda => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'rw')),
      'Kinyarwanda',
      'Kinyarwanda');
  static Language get klingon => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'tlh', scriptCode: 'Latn')),
      'Klingon',
      '');
  static Language get klingonPlqaD => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'tlh', scriptCode: 'Piqd')),
      'Klingon (plqaD)',
      '');

  static Language get konkani => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'gom')), 'Konkani', '');
  static Language get korean => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ko')),
      'Korean',
      '한국어 (韓國語) / 조선말 (朝鮮語)');
  static Language get kurdishCentral => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ku')),
      'Kurdish (Central)',
      'Kurdî / كوردی');
  static Language get kurdishNorthern => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'kmr')),
      'Kurdish (Northern)',
      'Kurdî / كوردی');
  static Language get kyrgyzCyrillic => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ky')),
      'Kyrgyz (Cyrillic)',
      'кыргыз тили');
  static Language get lao => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'lo')), 'Lao', 'ພາສາລາວ');
  static Language get latvian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'lv')),
      'Latvian',
      'Latviešu valoda');
  static Language get lithuanian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'lt')),
      'Lithuanian',
      'Lietuvių kalba');
  static Language get lingala => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ln')), 'Lingala', 'Lingála');
  static Language get lowerSorbian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'dsb')), 'Lower Sorbian', '');
  static Language get luganda => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'lug')), 'Luganda', '');
  static Language get macedonian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'mk')),
      'Macedonian',
      'македонски јазик');
  static Language get maithili => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'mai')), 'Maithili', '');
  static Language get malagasy => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'mg')),
      'Malagasy',
      'Fiteny malagasy');
  static Language get malayLatin => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ms')),
      'Malay (Latin)',
      'Bahasa Melayu / بهاس ملايو');
  static Language get malayalam => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ml')),
      'Malayalam',
      'മലയാളം');
  static Language get maltese => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'mt')), 'Maltese', 'Malti');
  static Language get maori => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'mi')),
      'Maori',
      'Te reo Māori');
  static Language get marathi => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'mr')), 'Marathi', 'मराठी');
  static Language get mongolianCyrillic => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'mn', scriptCode: 'Cyrl')),
      'Mongolian (Cyrillic)',
      'монгол хэл');
  static Language get mongolianTraditional => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'mn', scriptCode: 'Mong')),
      'Mongolian (Traditional)',
      'ᠮᠣᠩᠭᠣᠯ ᠬᠡᠯᠡ');
  static Language get myanmar => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'my')), 'Myanmar', 'ဗမာစာ');
  static Language get nepali => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ne')), 'Nepali', 'नेपाली');
  static Language get norwegian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'nb')),
      'Norwegian',
      'Norsk bokmål');
  static Language get nyanja => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'nya')), 'Nyanja', '');
  static Language get odia => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'or')), 'Odia', 'ଓଡ଼ିଆ');
  static Language get pashto => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ps')), 'Pashto', 'پښتو');
  static Language get persian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'fa')), 'Persian', '');
  static Language get polish => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'pl')), 'Polish', 'Polski');
  static Language get portugueseBrazil => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'pt')),
      'Portuguese (Brazil)',
      'Português');
  static Language get portuguesePortugal => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'pt-pt')),
      'Portuguese (Portugal)',
      'Português');
  static Language get punjabi => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'pa')),
      'Punjabi',
      'ਪੰਜਾਬੀ ; پنجابی');
  static Language get queretaroOtomi => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'otq')),
      'Queretaro Otomi',
      '');
  static Language get romanian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ro')), 'Romanian', 'Română');
  static Language get rundi => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'run')), 'Rundi', '');
  static Language get russian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ru')),
      'Russian',
      'русский язык');
  static Language get samoanLatin => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'sm')),
      'Samoan (Latin)',
      'Gagana fa\'a Samoa');
  static Language get serbianCyrillic => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'sr', scriptCode: 'Cyrl')),
      'Serbian (Cyrillic)',
      'српски');
  static Language get serbianLatin => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'sr', scriptCode: 'Latn')),
      'Serbian (Latin)',
      'srpski');
  static Language get sesotho => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'st')), 'Sesotho', 'seSotho');
  static Language get sesothoSaLeboa => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'nso')),
      'Sesotho sa Leboa',
      '');
  static Language get setswana => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'tn')),
      'Setswana',
      'seTswana');
  static Language get sindhi => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'sd')),
      'Sindhi',
      'सिन्धी / سنڌي، سندھی');
  static Language get sinhala => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'si')), 'Sinhala', 'සිංහල');
  static Language get slovak => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'sk')),
      'Slovak',
      'Slovenčina');
  static Language get slovenian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'sl')),
      'Slovenian',
      'Slovenščina');
  static Language get somaliArabic => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'so')),
      'Somali (Arabic)',
      'Soomaaliga / af Soomaali');
  static Language get spanish => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'es')), 'Spanish', 'Español');
  static Language get swahiliLatin => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'sw')),
      'Swahili (Latin)',
      'Kiswahili');
  static Language get swedish => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'sv')), 'Swedish', 'Svenska');
  static Language get tahitian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ty')),
      'Tahitian',
      'Reo Mā`ohi');
  static Language get tamil => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ta')), 'Tamil', 'தமிழ்');
  static Language get tatarLatin => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'tt')),
      'Tatar (Latin)',
      'татарча / tatarça / تاتارچا');
  static Language get telugu => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'te')), 'Telugu', 'తెలుగు');
  static Language get thai => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'th')), 'Thai', 'ไทย');
  static Language get tibetan => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'bo')), 'Tibetan', '');
  static Language get tigrinya => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ti')), 'Tigrinya', 'ትግርኛ');
  static Language get tongan => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'to')),
      'Tongan',
      'faka Tonga');
  static Language get turkish => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'tr')), 'Turkish', 'Türkçe');
  static Language get turkmenLatin => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'tk')),
      'Turkmen (Latin)',
      'Türkmen / Түркмен');
  static Language get ukrainian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'uk')),
      'Ukrainian',
      'українська мова');
  static Language get upperSorbian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'hsb')), 'Upper Sorbian', '');
  static Language get urdu => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ur')), 'Urdu', 'اردو');
  static Language get uyghurArabic => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ug')),
      'Uyghur (Arabic)',
      'Uyƣurqə ; ئۇيغۇرچ');
  static Language get uzbekLatin => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'uz')),
      'Uzbek (Latin)',
      'O\'zbek / Ўзбек / أۇزبېك');
  static Language get vietnamese => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'vi')),
      'Vietnamese',
      'Tiếng Việt');
  static Language get welsh => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'cy')), 'Welsh', 'Cymraeg');
  static Language get xhosa => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'xh')), 'Xhosa', 'isiXhosa');
  static Language get yoruba => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'yo')), 'Yoruba', 'Yorùbá');
  static Language get yucatecMaya => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'yua')),
      'Yucatec Maya',
      'Maya t\'aan');
  static Language get zulu => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'zu')), 'Zulu', 'isiZulu');

  // TODO : exact native name needs to be completed
  // TODO : local to be double checked
  static Language get abkhazian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ab')), 'Abkhazian', '');
  static Language get afar =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'aa')), 'Afar', '');
  static Language get akan =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'ak')), 'Akan', '');
  static Language get aragonese => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'an')), 'Aragonese', '');
  static Language get avaric => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'av')), 'Avaric', '');
  static Language get avestan => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ae')), 'Avestan', '');
  static Language get aymara => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ay')), 'Aymara', '');
  static Language get azerbaijani => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'az')), 'Azerbaijani', '');
  static Language get belarusian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'be')), 'Belarusian', '');
  static Language get bengali => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'bn')), 'Bengali', '');
  static Language get bihariLanguages => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'bh')),
      'Bihari Languages',
      '');
  static Language get bislama => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'bi')), 'Bislama', '');
  static Language get bosnian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'bs')), 'Bosnian', '');
  static Language get breton => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'br')), 'Breton', '');
  static Language get burmese => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'my')), 'Burmese', '');
  static Language get centralKhmer => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'km')), 'Central Khmer', '');
  static Language get chamorro => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ch')), 'Chamorro', '');
  static Language get chechen => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ce')), 'Chechen', '');
  static Language get chewaNyanja => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ny')), 'Chewa (Nyanja)', '');
  static Language get churchSlavonic => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'cu')),
      'Church Slavonic',
      '');
  static Language get chuvash => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'cv')), 'Chuvash', '');
  static Language get cornish => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'kw')), 'Cornish', '');
  static Language get corsican => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'co')), 'Corsican', '');
  static Language get cree =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'cr')), 'Cree', '');
  static Language get dhivehi => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'dv')), 'Dhivehi', '');
  static Language get dzongkha => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'dz')), 'Dzongkha', '');
  static Language get esperanto => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'eo')), 'Esperanto', '');
  static Language get ewe =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'ee')), 'Ewe', '');
  static Language get fulah =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'ff')), 'Fulah', '');
  static Language get gaelic => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'gd')), 'Gaelic', '');
  static Language get ganda =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'lg')), 'Ganda', '');
  static Language get guarani => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'gn')), 'Guarani', '');
  static Language get haitian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ht')), 'Haitian', '');
  static Language get herero => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'hz')), 'Herero', '');
  static Language get hiriMotu => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ho')), 'Hiri Motu', '');
  static Language get ido =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'io')), 'Ido', '');
  static Language get interlingua => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ia')), 'Interlingua', '');
  static Language get interlingue => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ie')), 'Interlingue', '');
  static Language get inupiaq => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ik')), 'Inupiaq', '');
  static Language get kalaallisut => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'kl')), 'Kalaallisut', '');
  static Language get kanuri => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'kr')), 'Kanuri', '');
  static Language get kikuyu => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ki')), 'Kikuyu', '');
  static Language get kirghiz => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ky')), 'Kirghiz', '');
  static Language get komi =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'kv')), 'Komi', '');
  static Language get kongo =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'kg')), 'Kongo', '');
  static Language get kuanyama => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'kj')), 'Kuanyama', '');
  static Language get kurdish => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ku')), 'Kurdish', '');
  static Language get latin =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'la')), 'Latin', '');
  static Language get limburgan => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'li')), 'Limburgan', '');
  static Language get lubaKatanga => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'lu')), 'Luba-Katanga', '');
  static Language get luxembourgish => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'lb')), 'Luxembourgish', '');
  static Language get malay =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'ms')), 'Malay', '');
  static Language get manx =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'gv')), 'Manx', '');
  static Language get marshallese => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'mh')), 'Marshallese', '');
  static Language get mongolian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'mn')), 'Mongolian', '');
  static Language get nauru =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'na')), 'Nauru', '');
  static Language get navajo => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'nv')), 'Navajo', '');
  static Language get ndebeleNorth => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'nd')), 'Ndebele, North', '');
  static Language get ndebeleSouth => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'nr')), 'Ndebele, South', '');
  static Language get ndonga => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ng')), 'Ndonga', '');
  static Language get northernSami => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'se')), 'Northern Sami', '');
  static Language get norwegianNynorsk => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'nn')),
      'Norwegian Nynorsk',
      '');
  static Language get occitan => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'oc')), 'Occitan', '');
  static Language get ojibwa => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'oj')), 'Ojibwa', '');
  static Language get oriya =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'or')), 'Oriya', '');
  static Language get oromo =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'om')), 'Oromo', '');
  static Language get ossetian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'os')), 'Ossetian', '');
  static Language get pali =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'pi')), 'Pali', '');
  static Language get panjabi => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'pa')), 'Panjabi', '');
  static Language get portuguese => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'pt')), 'Portuguese', '');
  static Language get pushto => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ps')), 'Pushto', '');
  static Language get quechua => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'qu')), 'Quechua', '');
  static Language get romansh => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'rm')), 'Romansh', '');
  static Language get samoan => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'sm')), 'Samoan', '');
  static Language get sango =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'sg')), 'Sango', '');
  static Language get sanskrit => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'sa')), 'Sanskrit', '');
  static Language get sardinian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'sc')), 'Sardinian', '');
  static Language get serbian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'sr')), 'Serbian', '');
  static Language get shona =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'sn')), 'Shona', '');
  static Language get sichuanYi => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ii')), 'Sichuan Yi', '');
  static Language get soso =>
      // TODO check locale for soussou
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'sou')), 'Soso',
          'Soussou');
  static Language get somali => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'so')), 'Somali', '');
  static Language get sothoSouthern => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'st')),
      'Sotho, Southern',
      '');
  static Language get sundanese => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'su')), 'Sundanese', '');
  static Language get swahili => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'sw')), 'Swahili', '');
  static Language get swati =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'ss')), 'Swati', '');
  static Language get tagalog => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'tl')), 'Tagalog', '');
  static Language get tajik =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'tg')), 'Tajik', '');
  static Language get tatar =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'tt')), 'Tatar', '');
  static Language get tongaTongaIslands => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'to')),
      'Tonga (Tonga Islands)',
      '');
  static Language get tsonga => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ts')), 'Tsonga', '');
  static Language get tswana => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'tn')), 'Tswana', '');
  static Language get turkmen => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'tk')), 'Turkmen', '');
  static Language get twi =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'tw')), 'Twi', '');
  static Language get uighur => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'ug')), 'Uighur', '');
  static Language get uzbek =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'uz')), 'Uzbek', '');
  static Language get venda =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 've')), 'Venda', '');
  static Language get volapuk => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'vo')), 'Volapük', '');
  static Language get walloon => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'wa')), 'Walloon', '');
  static Language get westernFrisian => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'fy')),
      'Western Frisian',
      '');
  static Language get wolof =>
      Language(LocaleIntl(Locale.fromSubtags(languageCode: 'wo')), 'Wolof', '');
  static Language get yiddish => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'yi')), 'Yiddish', 'Yiddish');
  static Language get zhuang => Language(
      LocaleIntl(Locale.fromSubtags(languageCode: 'za')), 'Zhuang', 'Zhuang');

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
    Languages.soso,
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
