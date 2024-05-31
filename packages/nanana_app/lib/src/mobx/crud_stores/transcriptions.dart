// Dart imports:
import 'dart:convert' as convert;

// Package imports:
import 'package:collection/collection.dart';
import 'package:languages_dart/languages_dart.dart';
import 'package:mobx/mobx.dart';
import 'package:nanana_app/src/models/transcription.dart';
import 'package:nanana_app/src/shared_prefs/endpoint_base.dart';

part 'transcriptions.g.dart';

class ReadAllTranscriptions implements EndpointBase<List<Transcription>, void> {
  ReadAllTranscriptions();

  @override
  Future<List<Transcription>> request(void data) {
    // TODO: implement request
    throw UnimplementedError();
  }
}

class UpdateTranscription
    implements EndpointBase<Transcription, Transcription> {
  UpdateTranscription();

  @override
  Future<Transcription> request(Transcription data) {
    // TODO: implement request
    throw UnimplementedError();
  }
}

class CreateTranscription
    implements EndpointBase<Transcription, Transcription> {
  CreateTranscription();

  @override
  Future<Transcription> request(Transcription data) async {
    // TODO: implement request
    // throw UnimplementedError();
    return data;
  }
}

class TranscriptionService {
  final CreateTranscription create;
  final ReadAllTranscriptions readAll;
  final UpdateTranscription update;
  TranscriptionService(this.create, this.readAll, this.update);
}

extension Filter on ObservableList<Transcription> {
  List<Transcription> searchBySong(String queryString) =>
      List<Transcription>.of(
          where((p) => p.song.clean.contains(queryString.clean)).toList());

  List<Transcription> searchById(String queryString) => List<Transcription>.of(
      where((p) => p.id.toString().contains(queryString.trim())).toList());

  ObservableList<Transcription> searchByTitleOrIdObs(String queryString) =>
      ObservableList<Transcription>.of(<Transcription>{
        ...searchBySong(queryString),
        ...searchById(queryString)
      });

  ObservableList<Transcription> searchBySongObs(String queryString) =>
      ObservableList.of(searchBySong(queryString));

  ObservableList<Transcription> searchByIdObs(String queryString) =>
      ObservableList<Transcription>.of(searchById(queryString));

  ObservableList<Transcription> sortedBySong() =>
      ObservableList.of(this..sort((a, b) => a.song.compareTo(b.song)));

  ObservableList<Transcription> sortedBySongReversed() =>
      ObservableList.of(this..sort((a, b) => b.song.compareTo(a.song)));

  ObservableList<Transcription> sortedById() {
    return ObservableList.of(
      this..sort((a, b) => a.id.compareTo(b.id)),
    );
  }

  ObservableList<Transcription> sortedByIdReversed() {
    return ObservableList.of(
      this..sort((a, b) => b.id.compareTo(a.id)),
    );
  }
}

enum SortedBy {
  unsorted,
  song,
  songReversed,
  id,
  idReversed,
}

enum SearchedBy { titleOrId, none } // categories will be added her eventually

class TranscriptionStore = TranscriptionStoreBase with _$TranscriptionStore;

abstract class TranscriptionStoreBase with Store {
  final TranscriptionService _transcriptionService;

  TranscriptionStoreBase(this._transcriptionService) {
    initialLoading = true;
    _transcriptionService;
    transcriptions = ObservableList<Transcription>();
    _transcriptionsFiltered = ObservableList<Transcription>();
    sortedBy = Observable(SortedBy.id);
    sortBy(SortedBy.id);
  }

  @observable
  bool initialLoading = true;

  @observable
  SearchedBy _searchedByPrivate = SearchedBy.none;

  SearchedBy get searchedBy => _searchedByPrivate;

  @action
  void setSearchedBy(SearchedBy val) => _searchedByPrivate = val;

  @observable
  String _queryStringPrivate = '';

  String get queryString => _queryStringPrivate;

  @action
  void setQueryString(String val) {
    _queryStringPrivate = val;
  }

  @observable
  Observable<SortedBy> sortedBy = Observable(SortedBy.song);

  @observable
  ObservableList<Transcription> transcriptions =
      ObservableList.of(<Transcription>[]);

  @observable
  ObservableList<Transcription> _transcriptionsFiltered =
      ObservableList.of(<Transcription>[]);

  @action
  ObservableList<Transcription> sortBy(SortedBy sortBy) {
    switch (sortBy) {
      case SortedBy.id:
        transcriptions = transcriptions.sortedById();
        sortedBy = Observable(SortedBy.id);
        break;
      case SortedBy.idReversed:
        transcriptions = transcriptions.sortedByIdReversed();
        sortedBy = Observable(SortedBy.idReversed);
        break;
      case SortedBy.song:
        transcriptions = transcriptions.sortedBySong();
        sortedBy = Observable(SortedBy.song);
        break;
      case SortedBy.songReversed:
        transcriptions = transcriptions.sortedBySongReversed();
        sortedBy = Observable(SortedBy.songReversed);
        break;
      default:
    }
    return transcriptions;
  }

  @action
  void searchBySongOrId() {
    if (transcriptions.isNotEmpty) {
      if (searchedBy == SearchedBy.titleOrId) {
        if (queryString.isNotEmpty) {
          _transcriptionsFiltered =
              transcriptions.searchByTitleOrIdObs(queryString);
        } else {}
      }
    }
  }

  @computed
  ObservableList<Transcription> get calibresSearchable {
    if (transcriptions.isEmpty) {
      return ObservableList<Transcription>.of([]);
    }
    if (queryString.isEmpty) {
      return ObservableList<Transcription>.of(transcriptions);
    }
    if (searchedBy == SearchedBy.titleOrId) {
      return ObservableList<Transcription>.of(
          transcriptions.searchByTitleOrIdObs(queryString));
    } else {
      return ObservableList<Transcription>.of(transcriptions);
    }
  }

  @action
  Future<bool> init({List<Transcription>? data}) async {
    if (data != null && data.isNotEmpty) {
      transcriptions = ObservableList.of(data);
    } else {
      final transcriptionsFromRpc =
          await _transcriptionService.readAll.request(null);
      if (transcriptionsFromRpc.isNotEmpty) {
        transcriptions = ObservableList.of(transcriptionsFromRpc);
      }
    }
    initialLoading = false;
    return initialLoading;
  }

  @action
  Future<void> clearSearch() async {
    setSearchedBy(SearchedBy.none);
    setQueryString('');
    // only way dart can clone a list
    _transcriptionsFiltered =
        ObservableList<Transcription>.of(transcriptions.map(
      (e) => Transcription(
          id: e.id,
          artist: e.artist,
          song: e.song,
          youtubeUrl: e.youtubeUrl,
          language: e.language,
          userId: e.userId),
    ));
  }

  @action
  Future<Transcription> updateTranscription(Transcription transcription) async {
    final updatedLine =
        await _transcriptionService.update.request(transcription);
    final index =
        transcriptions.indexWhere((element) => element.id == updatedLine.id);
    transcriptions.removeAt(index);
    transcriptions.add(updatedLine);
    return transcription;
  }

  @action
  Future<ObservableList<Transcription>> importFromJson(String json) async {
    final temp = (convert.json.decode(json) as List)
        .cast<Map>() // ?
        .cast<Map<String, dynamic>>()
        .map((line) => Transcription.fromMap(line))
        .toList();
    transcriptions = ObservableList.of(temp);
    for (final t in temp) {
      await _transcriptionService.create.request(t);
    }
    return transcriptions;
  }

  @action
  Future<Transcription> createOne(Transcription data) async {
    final temp = await _transcriptionService.create.request(data);
    transcriptions.add(temp);
    return temp;
  }
}
