import 'package:languages_dart/languages_dart.dart';
import 'package:mobx/mobx.dart';

mixin Validators on FormStoreAbstract {
  @action
  void validateSong(String value) {
    if (value.isEmpty) {
      errorStore.songError = 'Type song name';
    } else {
      errorStore.songError = null;
    }
    return;
  }

  @action
  void validateArtist(String value) {
    if (value.isEmpty) {
      errorStore.artistError = 'Type artist name';
    } else {
      errorStore.artistError = null;
    }
    return;
  }

  @action
  void validateLanguage(Language value) {
    if (value == Language.empty) {
      errorStore.languageError = 'select a language';
    } else {
      errorStore.languageError = null;
    }
    return;
  }
}

abstract class FormStoreAbstract {
  @observable
  String song = '';
  @observable
  String artist = '';
  @observable
  Language language = Language.empty;
  @observable
  String youtubeUrl = '';

  late FormErrorAbstract errorStore;
}

abstract class FormErrorAbstract {
  @observable
  String? songError, artistError, languageError, youtubeUrlError;

  @computed
  bool get hasErrors =>
      songError != null ||
      artistError != null ||
      languageError != null ||
      youtubeUrlError != null;
}
