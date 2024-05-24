import 'package:flutter/material.dart';
import 'package:nanana_app/find_panel_view.dart';
import 'package:re_editor/re_editor.dart';

class HomeView extends StatefulWidget {
  final String song;
  final String artist;
  final String language;
  final String album;
  final String videoUrl;
  const HomeView(
      {required this.song,
      required this.artist,
      required this.language,
      this.album = '',
      this.videoUrl = '',
      super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CodeLineEditingController _controller = CodeLineEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = mandjou;
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
        title: Text('${widget.song} - ${widget.artist}',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14, fontFamily: 'Barokah', color: Colors.black),
            overflow: TextOverflow.ellipsis),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${widget.language}',
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

const mandjou = '''
Mànju o, kàna kàsi !
Alifa Tùrela den, kàna kàsi !
Mànju o, kàna kàsi !
Minàta Fadiga den, kàna kàsi !
Mànju o, kàna kàsi !
Minàta Ncinin fà kàna kàsi !
Ala ka la balimaw ko tèn,
kàsi tùma ma se.

(Choeurs)
Mànju
Ala Mànju jɔ̀ sànu dɔ ye
Mandjou...
Mànju o, kàna kàsi !
Alifa Tùre la den kàna kàsi !
Mànju o, kàna kàsi !
Minàta Ncinin fà kàna kàsi !
Ala ka la balimaw ko tèn,
kàsi tùma ma se.

Mànju
Ala Mànju jɔ̀ sànu dɔ ye
Dieu, couvre Mandjou d’or !
Mànju, fàtigi bɛ fàko waso la
Mànju, faama Ala y’o k’i yé
Mànju, dentigi bɛ denko waso la
faama Ala y’o k’i yé
Mànju tìɲɛtigi ye tìɲɛko waso la
Mànju, faama Ala y’o k’i yé
Mànju, dentigi bɛ denko waso la lolon
faama Ala y’o k’i yé
Mànju o, kàna kàsi
Alifa Tùre la den kàna kàsi !
Mànju o, kàna kàsi
Aminàta Fadiga den kàna kàsi
Sifin na sàya man ɲì n fà,
kàsi tùma ma se.
Mànju, Ala Mànju jɔ̀ sànu dɔ ye
→ 6mn27
Subaaaa...
Tùreeee....

Touré
6mn34 - 8mn15
(passage difficile, transcription reportée...
Dommage car c’est probablement le passage le plus riche.
se reporter pour le moment à la traduction de Cheik M. Chérif Keïtachoses etc.)
(…) 

Mànju ko caman kɛ
Tùre Mànden mori
Kuma Mànden mori
Kuyate Mànden moriiii
Cissé Mànden mori
Jane Mànden mori
Sumare Mànden mori
O marabout des Kouyaté du Mandé...
Umaa Mànju
Tuɲa Mànju
Setigiya Mànju
Hakilitigiya Mànju
Sekuya Mànju (?)
...
8mn47-9mn22 (passage difficile encore...)
mùsotigi y’a furu ...
denkɛ tigi ye...
woloden tigi ye...
dunuya tigi ye...

(9:23 reprise du début)
Mànju o kàna kàsi
Alifa Tùre den kàna kàsi
Mànju o kàna kàsi
Aminàta Fadiga den kàna kàsi
Mànju o kàna kàsi
Aminàta Ncinin fà kàna kàsi !
XXX,
kàsi tùma ma se.
Choeurs
Mànju...
..Ala Mànju jɔ̀ sanu dɔ yé
Mànju, fàtigi bɛ fàko waso la
Mànju, faama Ala y’o k’i yé
Mànju, dentigi bɛ denko waso la
faama Ala y’o k’i yé
Mànju tìɲɛtigi ye tìɲɛko waso la
Mànju, faama Ala y’o k’i yé
Mànju o kàna kàsi
Alifa Tùre den kàna kàsi
Ala ka la balimaw ko tèn,
kàsi tùma ma se.
Mànju...
..Ala Mànju jɔ̀ sanu dɔ yé
...Ala Mànju jɔ̀ sanu dɔ yé
...Ala Mànju jɔ̀ sanu dɔ yé
..Ala Mànju jɔ̀ sanu dɔ yé
''';
