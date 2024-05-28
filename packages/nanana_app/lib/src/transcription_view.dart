import 'package:flutter/material.dart';
import 'package:nanana_app/src/player/player.dart';
import 'package:nanana_app/src/widgets/editor/find_panel_view.dart';
import 'package:nanana_app/src/models/transcription.dart';

import 'package:re_editor/re_editor.dart';

class TranscriptionView extends StatefulWidget {
  final bool isEdit;
  final Transcription transcription;
  const TranscriptionView(
      {required this.isEdit, required this.transcription, super.key});

  @override
  State<TranscriptionView> createState() => _TranscriptionViewState();
}

class _TranscriptionViewState extends State<TranscriptionView> {
  final CodeLineEditingController _controller = CodeLineEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = widget.transcription.lyrics;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.isEdit == false
          ? FloatingActionButton(
              child: const Icon(Icons.lock),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TranscriptionView(
                      isEdit: true,
                      transcription: widget.transcription,
                    ),
                  ),
                );
              },
            )
          : FloatingActionButton(
              child: const Icon(Icons.save),
              onPressed: () {
                // do the syncing saving boogie
              },
            ),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        title: Text(
          '${widget.transcription.song} - ${widget.transcription.artist}',
          style: const TextStyle(
              fontSize: 12, fontFamily: 'Barokah', color: Colors.black),
          overflow: TextOverflow.visible,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${widget.transcription.language.name}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 8, fontFamily: 'Barokah', color: Colors.black),
                overflow: TextOverflow.visible),
            // const IconButton(
            //   icon: Icon(Icons.share),
            //   onPressed: null,
            // ),
          )
        ],
      ),
      body: Column(
        children: [
          //TODO : make this conditionnal (mobile & youtubeUrl ok & fileDownloaded & readable)
          Flexible(flex: 2, fit: FlexFit.tight, child: PlayerView()),
          Flexible(
            flex: 8,
            fit: FlexFit.tight,
            child: CodeEditor(
              style: CodeEditorStyle(fontSize: 15),
              wordWrap: false, // keep the whole line on small screen no \n
              autofocus: true,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              margin: const EdgeInsets.all(8),
              controller: _controller,
              findBuilder: (context, controller, readOnly) =>
                  CodeFindPanelView(controller: controller, readOnly: readOnly),
            ),
          ),
        ],
      ),
    );
  }
}
