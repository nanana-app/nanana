// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcription.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TranscriptionFormStore on TranscriptionFormStoreAbs, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: 'TranscriptionFormStoreAbs.hasErrors'))
          .value;

  late final _$songAtom =
      Atom(name: 'TranscriptionFormStoreAbs.song', context: context);

  @override
  String get song {
    _$songAtom.reportRead();
    return super.song;
  }

  @override
  set song(String value) {
    _$songAtom.reportWrite(value, super.song, () {
      super.song = value;
    });
  }

  late final _$artistAtom =
      Atom(name: 'TranscriptionFormStoreAbs.artist', context: context);

  @override
  String get artist {
    _$artistAtom.reportRead();
    return super.artist;
  }

  @override
  set artist(String value) {
    _$artistAtom.reportWrite(value, super.artist, () {
      super.artist = value;
    });
  }

  late final _$youtubeUrlAtom =
      Atom(name: 'TranscriptionFormStoreAbs.youtubeUrl', context: context);

  @override
  String get youtubeUrl {
    _$youtubeUrlAtom.reportRead();
    return super.youtubeUrl;
  }

  @override
  set youtubeUrl(String value) {
    _$youtubeUrlAtom.reportWrite(value, super.youtubeUrl, () {
      super.youtubeUrl = value;
    });
  }

  late final _$languageAtom =
      Atom(name: 'TranscriptionFormStoreAbs.language', context: context);

  @override
  Language get language {
    _$languageAtom.reportRead();
    return super.language;
  }

  @override
  set language(Language value) {
    _$languageAtom.reportWrite(value, super.language, () {
      super.language = value;
    });
  }

  @override
  String toString() {
    return '''
song: ${song},
artist: ${artist},
youtubeUrl: ${youtubeUrl},
language: ${language},
hasErrors: ${hasErrors}
    ''';
  }
}

mixin _$FormErrorTranscriptionCreate on FormErrorTranscriptionCreateAbs, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: 'FormErrorTranscriptionCreateAbs.hasErrors'))
          .value;

  late final _$songErrorAtom =
      Atom(name: 'FormErrorTranscriptionCreateAbs.songError', context: context);

  @override
  String? get songError {
    _$songErrorAtom.reportRead();
    return super.songError;
  }

  @override
  set songError(String? value) {
    _$songErrorAtom.reportWrite(value, super.songError, () {
      super.songError = value;
    });
  }

  late final _$artistErrorAtom = Atom(
      name: 'FormErrorTranscriptionCreateAbs.artistError', context: context);

  @override
  String? get artistError {
    _$artistErrorAtom.reportRead();
    return super.artistError;
  }

  @override
  set artistError(String? value) {
    _$artistErrorAtom.reportWrite(value, super.artistError, () {
      super.artistError = value;
    });
  }

  late final _$youtubeUrlErrorAtom = Atom(
      name: 'FormErrorTranscriptionCreateAbs.youtubeUrlError',
      context: context);

  @override
  String? get youtubeUrlError {
    _$youtubeUrlErrorAtom.reportRead();
    return super.youtubeUrlError;
  }

  @override
  set youtubeUrlError(String? value) {
    _$youtubeUrlErrorAtom.reportWrite(value, super.youtubeUrlError, () {
      super.youtubeUrlError = value;
    });
  }

  @override
  String toString() {
    return '''
songError: ${songError},
artistError: ${artistError},
youtubeUrlError: ${youtubeUrlError},
hasErrors: ${hasErrors}
    ''';
  }
}
