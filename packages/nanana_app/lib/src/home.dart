import 'package:flutter/material.dart';
import 'package:nanana_app/src/drawer.dart';
import 'package:nanana_app/src/editor/transcribe.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const DrawerNanana(),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          CardWidget(),
          // CardWidget(),
          // CardWidget(),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TranscribeView(
              song: 'Mandjou',
              artist: 'Salif Keita',
              language: 'Malinké',
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(
          top: 5,
          bottom: 5,
        ),
        elevation: 3.0,
        color: Colors.teal[100],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Mandjou\nSalif Keita"),
            ],
          ),
        ),
      ),
    );
  }
}
