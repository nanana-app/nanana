import 'package:flutter/material.dart';
import 'package:nanana_app/src/drawer.dart';
import 'package:nanana_app/src/editor/transcription_view.dart';
import 'package:nanana_app/src/models/transcription.dart';

class TranscriptionsView extends StatelessWidget {
  const TranscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const DrawerNanana(),
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
            builder: (context) => TranscriptionView(notation: notation),
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
