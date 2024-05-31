import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:language_picker_native_tongue/language_picker_native_tongue.dart';
import 'package:languages_dart/languages_dart.dart';
import 'package:nanana_app/src/widgets/editor/find_panel_view.dart';
import 'package:nanana_app/src/transcription_view.dart';
import 'package:nanana_app/src/mobx/crud_stores/transcriptions.dart';
import 'package:nanana_app/src/mobx/validators/abstract.dart';
import 'package:nanana_app/src/mobx/validators/transcription.dart';
import 'package:nanana_app/src/models/transcription.dart';
import 'package:nanana_app/src/widgets/dialog.dart';
import 'package:provider/provider.dart';

import 'package:re_editor/re_editor.dart';

const double widgetHeightSpacer = 12;

class CreateTranscriptionView extends StatefulWidget {
  const CreateTranscriptionView({super.key});

  @override
  State<CreateTranscriptionView> createState() =>
      _CreateTranscriptionViewState();
}

class _CreateTranscriptionViewState extends State<CreateTranscriptionView> {
  final scrollController = ScrollController();
  late TranscriptionFormStore validator;
  final languageTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final _store = Provider.of<TranscriptionStore>(context, listen: false);
    validator = TranscriptionFormStore(_store);
    validator.setupValidations();
    languageTextController.text = validator.language.name;
  }

  @override
  void dispose() {
    languageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () async {
          // do the syncing saving boogie
          validator.validateAll();
          if (validator.hasErrors) {
            return;
          }
          try {
            final transcription = await validator.createTranscriptionFromForm();
            print(transcription.toMap());
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TranscriptionView(
                    isEdit: true, transcription: transcription),
              ),
            );
          } catch (e) {
            return InformDialog.showDialogNanana("$e", context);
          }
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        title: Text('Create new transcription',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14, fontFamily: 'Barokah', color: Colors.black),
            overflow: TextOverflow.visible),
        actions: [],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // TODO fill the onsubmit to preload other fields
              YoutubeUrlTextField(validator),
              const SizedBox(height: widgetHeightSpacer),
              SongTextField(validator),
              const SizedBox(height: widgetHeightSpacer),
              ArtistTextField(validator),
              const SizedBox(height: widgetHeightSpacer),
              // languageTextWidget
              GestureDetector(
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (context) => Theme(
                      data: Theme.of(context),
                      child: LanguagePickerDialog(
                        searchInputDecoration: const InputDecoration(
                          icon: Icon(Icons.search),
                        ),
                        isSearchable: true,
                        title: const Text(''),
                        onValuePicked: (Language language) async {
                          setState(() {
                            validator.language = language;
                            languageTextController.text =
                                language.name.isEmpty && language.nameEn.isEmpty
                                    ? ''
                                    : language.name.isEmpty
                                        ? language.nameEn
                                        : language.name;
                          });
                        },
                        itemBuilder: (language) => LanguageWidget(language),
                      ),
                    ),
                  );
                },
                child: TextFormField(
                  maxLines: 1,
                  style: const TextStyle(color: Colors.black),
                  enabled: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Language*',
                    labelStyle: const TextStyle(color: Colors.black),
                    icon: const Icon(Icons.translate),
                    errorText: validator.errorStore.languageError,
                  ),
                  controller: languageTextController,
                ),
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
