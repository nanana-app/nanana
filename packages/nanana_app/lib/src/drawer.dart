import 'package:flutter/material.dart';
import 'package:nanana_app/src/app/d_material_app.dart';
import 'package:nanana_app/src/app/l10n.dart';
import 'package:nanana_app/src/create_transcription.dart';
import 'package:nanana_app/src/video_player.dart';
import 'package:nanana_app/src/youtube_download.dart';
import 'package:nanana_app/src/widgets/language_select.dart';
import 'package:nanana_app/src/app/top_provider.dart';
import 'package:nanana_app/src/transcription_view.dart';
import 'package:nanana_app/src/home.dart';
import 'package:nanana_app/src/player/player.dart';
import 'package:nanana_app/src/youtube_metadata_capturer.dart';
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
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            appBar: AppBar(),
                            drawer: const DrawerNanana(),
                            body: const TranscriptionsView(),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                            child: Text(
                              top.appBuildInt != 0
                                  ? 'na na na v${top.appBuildInt}'
                                  : top.appVersion !=
                                          '1.0.0' // version == buildnumber
                                      ? 'na na na v${top.appVersion}'
                                      : 'na na na',
                              style: const TextStyle(
                                  fontFamily: 'Barokah',
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  overflow: TextOverflow.visible),
                              textAlign: TextAlign.start,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  DrawerTopTileWidget(
                      const Icon(Icons.edit), Text('Youtube metadata capturer'),
                      () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const YoutubeMetadataCapturerView(),
                      ),
                    );
                  }),
                  DrawerTopTileWidget(const Icon(Icons.edit), Text('Youtube'),
                      () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const YoutubeDownloadVideoView(title: 'youtube'),
                      ),
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
            DrawerTopTileWidget(
                const Icon(
                  Icons.play_circle_outline,
                ),
                Text('video Player'), () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                        appBar: AppBar(),
                        drawer: const DrawerNanana(),
                        body: const VideoApp())),
              );
            }),
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
            ListTile(
              title: const Text('language'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LanguageSelectWidget(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
