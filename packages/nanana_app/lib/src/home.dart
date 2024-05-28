import 'package:flutter/material.dart';
import 'package:nanana_app/src/app/l10n.dart';
import 'package:nanana_app/src/create_transcription.dart';
import 'package:nanana_app/src/drawer.dart';
import 'package:nanana_app/src/transcription_view.dart';
import 'package:nanana_app/src/mobx/crud_stores/transcriptions.dart';
import 'package:nanana_app/src/models/transcription.dart';
import 'package:nanana_app/src/widgets/app_bar_search.dart';
import 'package:provider/provider.dart';

class TranscriptionsView extends StatelessWidget {
  const TranscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final transcriptionStore =
        Provider.of<TranscriptionStore>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // TODO pursue search and use mobx reaction
        // title: TopBarSearchTranscriptions(transcriptionStore),
        // actions: [TopBarAction(transcriptionStore)],
      ),
      drawer: const DrawerNanana(),
      floatingActionButton: FloatingActionButton(
          tooltip: context.l10n.createNewTranscription,
          child: const Icon(Icons.edit),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CreateTranscriptionView(),
              ),
            );
          }),
      body: GridView.count(
        primary: true,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          for (final notation in TranscriptionDummy.notations)
            CardWidget(notation),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final Transcription notation;
  const CardWidget(this.notation, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                TranscriptionView(isEdit: false, transcription: notation),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        elevation: 3.0,
        color: Colors.teal[100],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${notation.artist}\n${notation.song}"),
            ],
          ),
        ),
      ),
    );
  }
}
