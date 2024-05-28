import 'package:flutter/material.dart';
import 'package:nanana_app/src/mobx/crud_stores/transcriptions.dart';
import 'package:provider/provider.dart';

class TopBarAction extends StatelessWidget {
  final TranscriptionStore transcriptionStore;
  // final void Function()? onPressedCloseIconButton;
  const TopBarAction(this.transcriptionStore, //this.onPressedCloseIconButton,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close),
      color: Colors.black,
      onPressed: () {
        transcriptionStore.clearSearch();
        transcriptionStore.setSearchedBy(SearchedBy.none);
        transcriptionStore.setQueryString('');
      },
    );
  }
}

class TopBarSearchTranscriptions extends StatefulWidget {
  final TranscriptionStore transcriptionStore;
  const TopBarSearchTranscriptions(this.transcriptionStore, {super.key});

  @override
  State<TopBarSearchTranscriptions> createState() =>
      _TopBarSearchTranscriptionsState();
}

class _TopBarSearchTranscriptionsState
    extends State<TopBarSearchTranscriptions> {
  final textController = TextEditingController();
  late TranscriptionStore transcriptionStore;

  @override
  void initState() {
    super.initState();
    transcriptionStore =
        Provider.of<TranscriptionStore>(context, listen: false);
    textController.addListener(() {
      transcriptionStore.setQueryString(textController.text);
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      style: const TextStyle(color: Colors.black),
      keyboardType: TextInputType.text,
      controller: textController,
      decoration: InputDecoration(
        icon: const Icon(Icons.search),
        // hintText: "${context.l10n.articleLibelle} ${context.l10n.ou} #",
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
