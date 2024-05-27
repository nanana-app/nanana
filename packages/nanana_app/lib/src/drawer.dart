import 'package:flutter/material.dart';
import 'package:nanana_app/src/app/d_material_app.dart';
import 'package:nanana_app/src/app/l10n.dart';
import 'package:nanana_app/src/app/language_select.dart';
import 'package:nanana_app/src/app/top_provider.dart';
import 'package:nanana_app/src/editor/transcribe.dart';
import 'package:nanana_app/src/player/player.dart';
import 'package:provider/provider.dart';

class DrawerTopTileWidget extends StatelessWidget {
  final Icon icon;
  final Text text;
  final void Function() onTap;

  const DrawerTopTileWidget(this.icon, this.text, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 28, 10),
              child: icon,
            ),
            Expanded(child: text),
          ],
        ),
      ),
    );
  }
}

class DrawerNanana extends StatelessWidget {
  const DrawerNanana({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final top = Provider.of<TopProvider>(context, listen: false);

    return Drawer(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 252,
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                          child: SelectableText.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: top.appBuildInt != 0
                                      ? 'Nana v${top.appBuildInt}'
                                      : top.appVersion !=
                                              '1.0.0' // version == buildnumber
                                          ? 'Nana v${top.appVersion}'
                                          : 'Nana',
                                  style: const TextStyle(
                                    fontFamily: 'Barokah',
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    DrawerTopTileWidget(
                        const Icon(Icons.edit), Text('Transcribe'), () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TranscribeView(
                            song: 'Mandjou',
                            artist: 'Salif Keita',
                            language: 'Malinké',
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 10),
                    DrawerTopTileWidget(
                        const Icon(
                          Icons.play_circle_outline,
                        ),
                        Text('Player'), () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => Scaffold(
                                appBar: AppBar(),
                                drawer: const DrawerNanana(),
                                body: const PlayerView())),
                      );
                    }),
                    //const SizedBox(height: 10),
                    // DrawerTopTileWidget(
                    //     const Icon(Icons.support_agent,
                    //         color: Color(0xFF41407C)),
                    //     Text('support'), () {
                    //   Navigator.of(context).pop();
                    //   Navigator.of(context).pushNamed(HelpRoute.routePath);
                    // }),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('language'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const LanguageSelectWidget(
                            isFirstScreen: false,
                          )),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
