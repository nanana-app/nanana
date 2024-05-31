import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:languages_dart/languages_dart.dart';
import 'package:nanana_app/src/models/lyrics.dart';

class DatesNanana {
  static final dateDefault = DateTime(2024, 04, 04);
}

class TranscriptionDummy {
  static final notations = <Transcription>[
    Transcription(
        id: 1,
        artist: 'Salif Keita',
        song: 'Mandjou',
        youtubeUrl: '',
        // TODO: upload package language as a standalone and inherit in native
        language: Languages.bambara,
        userId: 'dummyUser',
        lyrics: LyricsDummy.mandjou),
    Transcription(
      id: 2,
      userId: 'dummyUser',
      artist: 'El Fudge',
      song: "Rockin'it",
      youtubeUrl: '',
      language: Languages.english,
      lyrics: LyricsDummy.rockinIt,
    ),
    Transcription(
      id: 3,
      userId: 'dummyUser',
      artist: 'Nougaro',
      song: 'Tu verras',
      youtubeUrl: '',
      language: Languages.french,
      lyrics: LyricsDummy.tuVerras,
    ),
    Transcription(
      id: 4,
      userId: 'dummyUser',
      artist: 'Sting',
      song: "It's probably me",
      youtubeUrl: '',
      language: Languages.english,
      lyrics: LyricsDummy.itsProbablyMe,
    )
  ];
}

enum LyricsOrigin {
  transcribedByMyself,
  officialLyricVideo,
  anotherWebsite,
  albumBooklet,
  other,
  unknown
}

class Transcription {
  final int id;
  final String artist, album, song, youtubeUrl, userId, lyrics;
  final Language language;
  final DateTime? dateCreate, dateUpdate;
  final LyricsOrigin lyricsOrigin;

  const Transcription({
    required this.id,
    required this.artist,
    this.album = '',
    required this.song,
    required this.youtubeUrl,
    required this.language,
    required this.userId,
    this.dateCreate,
    this.dateUpdate,
    this.lyrics = '',
    this.lyricsOrigin = LyricsOrigin.unknown,
  });

  Transcription copyWith({
    int? id,
    String? artist,
    String? album,
    String? song,
    String? youtubeUrl,
    Language? language,
    String? userId,
    DateTime? dateCreate,
    DateTime? dateUpdate,
    String? lyrics,
    LyricsOrigin? lyricsOrigin,
  }) {
    return Transcription(
      id: id ?? this.id,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      song: song ?? this.song,
      youtubeUrl: youtubeUrl ?? this.youtubeUrl,
      language: language ?? this.language,
      userId: userId ?? this.userId,
      dateCreate: dateCreate ?? this.dateCreate,
      dateUpdate: dateUpdate ?? this.dateUpdate,
      lyrics: lyrics ?? this.lyrics,
      lyricsOrigin: lyricsOrigin ?? this.lyricsOrigin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'artist': artist,
      'album': album,
      'song': song,
      'youtubeUrl': youtubeUrl,
      'language': language.toMap(),
      'userId': userId,
      'dateCreate': dateCreate?.toIso8601String(),
      'dateUpdate': dateUpdate?.toIso8601String(),
      'lyrics': lyrics,
      'lyricsOrigin': lyricsOrigin.toString(),
    };
  }

  factory Transcription.fromMap(Map<String, dynamic> map) {
    return Transcription(
      id: map['id']?.toInt() ?? 0,
      artist: map['artist'] ?? '',
      album: map['album'] ?? '',
      song: map['song'] ?? '',
      youtubeUrl: map['youtubeUrl'] ?? '',
      language: Language.fromMap(map['language']),
      userId: map['userId'] ?? '',
      dateCreate: DateTime.tryParse(map['dateCreate'] ?? ''),
      dateUpdate: DateTime.tryParse(map['dateUpdate'] ?? ''),
      lyrics: map['lyrics'] ?? '',
      lyricsOrigin: LyricsOrigin.values
              .firstWhereOrNull((e) => e == (map['lyrics'] ?? '')) ??
          LyricsOrigin.unknown,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transcription.fromJson(String source) =>
      Transcription.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Notation(id: $id, artist: $artist, album: $album, song: $song, youtubeUrl: $youtubeUrl, language: $language, userId: $userId, dateCreate: $dateCreate, dateUpdate: $dateUpdate, lyrics: $lyrics)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transcription &&
        other.id == id &&
        other.artist == artist &&
        other.album == album &&
        other.song == song &&
        other.youtubeUrl == youtubeUrl &&
        other.language == language &&
        other.userId == userId &&
        other.dateCreate == dateCreate &&
        other.dateUpdate == dateUpdate &&
        other.lyrics == lyrics;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        artist.hashCode ^
        album.hashCode ^
        song.hashCode ^
        youtubeUrl.hashCode ^
        language.hashCode ^
        userId.hashCode ^
        dateCreate.hashCode ^
        dateUpdate.hashCode ^
        lyrics.hashCode;
  }
}
