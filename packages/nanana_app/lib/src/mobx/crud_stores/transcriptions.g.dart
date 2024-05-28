// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcriptions.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TranscriptionStore on TranscriptionStoreBase, Store {
  Computed<ObservableList<Transcription>>? _$calibresSearchableComputed;

  @override
  ObservableList<Transcription> get calibresSearchable =>
      (_$calibresSearchableComputed ??= Computed<ObservableList<Transcription>>(
              () => super.calibresSearchable,
              name: 'TranscriptionStoreBase.calibresSearchable'))
          .value;

  late final _$initialLoadingAtom =
      Atom(name: 'TranscriptionStoreBase.initialLoading', context: context);

  @override
  bool get initialLoading {
    _$initialLoadingAtom.reportRead();
    return super.initialLoading;
  }

  @override
  set initialLoading(bool value) {
    _$initialLoadingAtom.reportWrite(value, super.initialLoading, () {
      super.initialLoading = value;
    });
  }

  late final _$_searchedByPrivateAtom =
      Atom(name: 'TranscriptionStoreBase._searchedByPrivate', context: context);

  @override
  SearchedBy get _searchedByPrivate {
    _$_searchedByPrivateAtom.reportRead();
    return super._searchedByPrivate;
  }

  @override
  set _searchedByPrivate(SearchedBy value) {
    _$_searchedByPrivateAtom.reportWrite(value, super._searchedByPrivate, () {
      super._searchedByPrivate = value;
    });
  }

  late final _$_queryStringPrivateAtom = Atom(
      name: 'TranscriptionStoreBase._queryStringPrivate', context: context);

  @override
  String get _queryStringPrivate {
    _$_queryStringPrivateAtom.reportRead();
    return super._queryStringPrivate;
  }

  @override
  set _queryStringPrivate(String value) {
    _$_queryStringPrivateAtom.reportWrite(value, super._queryStringPrivate, () {
      super._queryStringPrivate = value;
    });
  }

  late final _$sortedByAtom =
      Atom(name: 'TranscriptionStoreBase.sortedBy', context: context);

  @override
  Observable<SortedBy> get sortedBy {
    _$sortedByAtom.reportRead();
    return super.sortedBy;
  }

  @override
  set sortedBy(Observable<SortedBy> value) {
    _$sortedByAtom.reportWrite(value, super.sortedBy, () {
      super.sortedBy = value;
    });
  }

  late final _$transcriptionsAtom =
      Atom(name: 'TranscriptionStoreBase.transcriptions', context: context);

  @override
  ObservableList<Transcription> get transcriptions {
    _$transcriptionsAtom.reportRead();
    return super.transcriptions;
  }

  @override
  set transcriptions(ObservableList<Transcription> value) {
    _$transcriptionsAtom.reportWrite(value, super.transcriptions, () {
      super.transcriptions = value;
    });
  }

  late final _$_transcriptionsFilteredAtom = Atom(
      name: 'TranscriptionStoreBase._transcriptionsFiltered', context: context);

  @override
  ObservableList<Transcription> get _transcriptionsFiltered {
    _$_transcriptionsFilteredAtom.reportRead();
    return super._transcriptionsFiltered;
  }

  @override
  set _transcriptionsFiltered(ObservableList<Transcription> value) {
    _$_transcriptionsFilteredAtom
        .reportWrite(value, super._transcriptionsFiltered, () {
      super._transcriptionsFiltered = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('TranscriptionStoreBase.init', context: context);

  @override
  Future<bool> init({List<Transcription>? data}) {
    return _$initAsyncAction.run(() => super.init(data: data));
  }

  late final _$clearSearchAsyncAction =
      AsyncAction('TranscriptionStoreBase.clearSearch', context: context);

  @override
  Future<void> clearSearch() {
    return _$clearSearchAsyncAction.run(() => super.clearSearch());
  }

  late final _$updateTranscriptionAsyncAction = AsyncAction(
      'TranscriptionStoreBase.updateTranscription',
      context: context);

  @override
  Future<Transcription> updateTranscription(Transcription transcription) {
    return _$updateTranscriptionAsyncAction
        .run(() => super.updateTranscription(transcription));
  }

  late final _$importFromJsonAsyncAction =
      AsyncAction('TranscriptionStoreBase.importFromJson', context: context);

  @override
  Future<ObservableList<Transcription>> importFromJson(String json) {
    return _$importFromJsonAsyncAction.run(() => super.importFromJson(json));
  }

  late final _$createOneAsyncAction =
      AsyncAction('TranscriptionStoreBase.createOne', context: context);

  @override
  Future<Transcription> createOne(Transcription data) {
    return _$createOneAsyncAction.run(() => super.createOne(data));
  }

  late final _$TranscriptionStoreBaseActionController =
      ActionController(name: 'TranscriptionStoreBase', context: context);

  @override
  void setSearchedBy(SearchedBy val) {
    final _$actionInfo = _$TranscriptionStoreBaseActionController.startAction(
        name: 'TranscriptionStoreBase.setSearchedBy');
    try {
      return super.setSearchedBy(val);
    } finally {
      _$TranscriptionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQueryString(String val) {
    final _$actionInfo = _$TranscriptionStoreBaseActionController.startAction(
        name: 'TranscriptionStoreBase.setQueryString');
    try {
      return super.setQueryString(val);
    } finally {
      _$TranscriptionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableList<Transcription> sortBy(SortedBy sortBy) {
    final _$actionInfo = _$TranscriptionStoreBaseActionController.startAction(
        name: 'TranscriptionStoreBase.sortBy');
    try {
      return super.sortBy(sortBy);
    } finally {
      _$TranscriptionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchBySongOrId() {
    final _$actionInfo = _$TranscriptionStoreBaseActionController.startAction(
        name: 'TranscriptionStoreBase.searchBySongOrId');
    try {
      return super.searchBySongOrId();
    } finally {
      _$TranscriptionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
initialLoading: ${initialLoading},
sortedBy: ${sortedBy},
transcriptions: ${transcriptions},
calibresSearchable: ${calibresSearchable}
    ''';
  }
}
