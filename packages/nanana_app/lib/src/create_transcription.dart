import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:language_picker/export.dart';
import 'package:languages_dart/export.dart';
import 'package:nanana_app/src/editor/find_panel_view.dart';
import 'package:nanana_app/src/mobx/transcriptions.dart';
import 'package:nanana_app/src/mobx/validators/abstract.dart';
import 'package:nanana_app/src/mobx/validators/transcription.dart';
import 'package:nanana_app/src/models/transcription.dart';

import 'package:re_editor/re_editor.dart';

class CreateTranscriptionView extends StatefulWidget {
  const CreateTranscriptionView({super.key});

  @override
  State<CreateTranscriptionView> createState() =>
      _CreateTranscriptionViewState();
}

class _CreateTranscriptionViewState extends State<CreateTranscriptionView> {
  final scrollController = ScrollController();
  late TranscriptionFormStore validator;

  @override
  void initState() {
    super.initState();
    final create = CreateTranscription();
    final readAll = ReadAllTranscriptions();
    final update = UpdateTranscription();
    final service = TranscriptionService(create, readAll, update);
    final store = TranscriptionsStore(service);
    validator = TranscriptionFormStore(store);
    validator.setupValidations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          // do the syncing saving boogie
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        title: Text('Create new transcription',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14, fontFamily: 'Barokah', color: Colors.black),
            overflow: TextOverflow.ellipsis),
        actions: [],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              YoutubeUrlTextField(validator),
              SongTextField(validator),
              ArtistTextField(validator),
              GestureDetector(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) => Theme(
                        data: Theme.of(context),
                        child: LanguagePickerDialog(
                          searchInputDecoration:
                              const InputDecoration(icon: Icon(Icons.search)),
                          isSearchable: true,
                          title: const Text(''),
                          onValuePicked: (Language language) async {
                            setState(() {
                              validator.language = language;
                            });
                          },
                          itemBuilder: (language) => LanguageWidget(language),
                        ),
                      ),
                    );
                  },
                  child: LanguageWidget(validator.language)

                  // TODO fill the onsubmit to preload other fields

                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class YoutubeUrlTextField<S extends FormStoreAbstract> extends StatelessWidget {
  final S store;
  const YoutubeUrlTextField(this.store, {super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      name: 'youtubeUrlTextField',
      builder: (_) => TextFormField(
        initialValue: store.song,
        key: const Key('youtube'),
        onChanged: (value) => store.youtubeUrl = value,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: 'Youtube Url',
            icon: const Icon(Icons.music_video),
            errorText: store.errorStore.youtubeUrlError),
        autofocus: true,
      ),
    );
  }
}

class SongTextField<S extends FormStoreAbstract> extends StatelessWidget {
  final S store;
  const SongTextField(this.store, {super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      name: 'songTextField',
      builder: (_) => TextFormField(
        initialValue: store.song,
        key: const Key('song'),
        onChanged: (value) => store.song = value,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: 'Song*',
            icon: const Icon(Icons.short_text),
            errorText: store.errorStore.songError),
        autofocus: false,
      ),
    );
  }
}

class ArtistTextField<S extends FormStoreAbstract> extends StatelessWidget {
  final S store;
  const ArtistTextField(this.store, {super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      name: 'artistTextField',
      builder: (_) => TextFormField(
        initialValue: store.artist,
        key: const Key('artist'),
        onChanged: (value) => store.artist = value,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: 'Artist*',
            icon: const Icon(Icons.supervised_user_circle_sharp),
            errorText: store.errorStore.artistError),
        autofocus: false,
      ),
    );
  }
}
