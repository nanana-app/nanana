// ignore_for_file: overridden_fields
//
import 'package:languages_dart/export.dart';
import 'package:mobx/mobx.dart';
import 'package:nanana_app/src/mobx/transcriptions.dart';
import 'package:nanana_app/src/mobx/validators/abstract.dart';
import 'package:nanana_app/src/models/transcription.dart';

part 'transcription.g.dart';

class TranscriptionFormStore = TranscriptionFormStoreAbs
    with _$TranscriptionFormStore;

abstract class TranscriptionFormStoreAbs extends FormStoreAbstract
    with Store, Validators {
  final TranscriptionsStore _transcriptionsStore;
  TranscriptionFormStoreAbs(this._transcriptionsStore);

  @override
  FormErrorAbstract errorStore = FormErrorTranscriptionCreate();

  @override
  @observable
  String song = '';

  @override
  @observable
  String artist = '';

  @override
  @observable
  String youtubeUrl = '';

  @override
  @observable
  Language language = Language.empty;

  @computed
  bool get hasErrors => errorStore.hasErrors;

  List<ReactionDisposer> _disposers = [];

  void setupValidations() {
    _disposers = [
      reaction((_) => song, validateSong),
      reaction((_) => artist, validateArtist),
      reaction((_) => language, validateLanguage),
    ];
  }

  void validateAll() {
    validateSong(song);
    validateArtist(artist);
    validateLanguage(language);
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  Future<Transcription> createTranscriptionFromForm() async {
    final now = DateTime.now();
    final transcription = Transcription(
      id: 0,
      artist: artist.trim(),
      song: song.trim(),
      youtubeUrl: youtubeUrl,
      language: language,
      userId: 'dummyUse',
      dateCreate: now,
    );

    return await _transcriptionsStore.createOne(transcription);
  }
}

class FormErrorTranscriptionCreate = FormErrorTranscriptionCreateAbs
    with _$FormErrorTranscriptionCreate;

abstract class FormErrorTranscriptionCreateAbs
    with Store
    implements FormErrorAbstract {
  @override
  @observable
  String? songError;

  @override
  @observable
  String? artistError;

  @observable
  @override
  String? youtubeUrlError;

  @observable
  @override
  String? languageError;

  @override
  @computed
  bool get hasErrors =>
      songError != null ||
      artistError != null ||
      youtubeUrlError != null ||
      languageError != null;
}
