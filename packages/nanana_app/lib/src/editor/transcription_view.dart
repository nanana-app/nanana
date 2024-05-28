import 'package:flutter/material.dart';
import 'package:nanana_app/src/editor/find_panel_view.dart';
import 'package:nanana_app/src/models/transcription.dart';

import 'package:re_editor/re_editor.dart';

class TranscriptionView extends StatefulWidget {
  final Transcription notation;
  const TranscriptionView({required this.notation, super.key});

  @override
  State<TranscriptionView> createState() => _TranscriptionViewState();
}

class _TranscriptionViewState extends State<TranscriptionView> {
  final CodeLineEditingController _controller = CodeLineEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = widget.notation.lyrics;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.save),
      //   onPressed: () {
      //     // do the syncing saving boogie
      //   },
      // ),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        title: Text(
          '${widget.notation.song} - ${widget.notation.artist}',
          style: const TextStyle(
              fontSize: 14, fontFamily: 'Barokah', color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${widget.notation.language.name}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 8, fontFamily: 'Barokah', color: Colors.black),
                overflow: TextOverflow.ellipsis),
            // const IconButton(
            //   icon: Icon(Icons.share),
            //   onPressed: null,
            // ),
          )
        ],
      ),
      body: CodeEditor(
        style: CodeEditorStyle(fontSize: 15),
        wordWrap: false, // keep the whole line on small screen no \n
        autofocus: true,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        margin: const EdgeInsets.all(8),
        controller: _controller,
        findBuilder: (context, controller, readOnly) =>
            CodeFindPanelView(controller: controller, readOnly: readOnly),
      ),
    );
  }
}
