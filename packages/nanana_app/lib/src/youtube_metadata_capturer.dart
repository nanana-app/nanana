import 'dart:io';
import 'dart:typed_data';

// import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:nanana_app/src/app/dir_config.dart';
import 'package:nanana_app/src/app/ze_stuff.dart';
import 'package:path/path.dart' as path;
// import 'package:permission_handler/permission_handler.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeMetadata {
  final String title, description, duration, thumbnailUrl;
  const YoutubeMetadata({
    this.title = '',
    this.description = '',
    this.duration = '',
    this.thumbnailUrl = '',
  });
}

class YoutubeMetadataCapturerView extends StatefulWidget {
  const YoutubeMetadataCapturerView({super.key});

  @override
  YoutubeMetadataCapturerViewState createState() =>
      YoutubeMetadataCapturerViewState();
}

class YoutubeMetadataCapturerViewState
    extends State<YoutubeMetadataCapturerView> {
  final textController = TextEditingController();

  Future<YoutubeMetadata> captureYoutubeMetadata() async {
    final yt = YoutubeExplode();
    final id = VideoId(textController.text.trim());

    final video = await yt.videos.get(id);
    String title = '', description = '', duration = '', thumbnailUrl = '';
    thumbnailUrl = video.thumbnails.highResUrl;
    title = video.title;
    duration = video.duration.toString();
    description = video.description;
    return YoutubeMetadata(
      title: title,
      description: description,
      duration: duration,
      thumbnailUrl: thumbnailUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Insert the video id or url',
            ),
            TextField(controller: textController),
            ElevatedButton(
                child: const Text('Capture'), onPressed: () => setState(() {})),
            if (textController.text.isNotEmpty)
              FutureBuilder2<YoutubeMetadata>(
                  future: captureYoutubeMetadata(),
                  builder: (_, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator.adaptive();
                    } else if (snap.hasError ||
                        (snap.connectionState != ConnectionState.waiting &&
                            !snap.hasData)) {
                      return ColoredBox(
                          color: const Color.fromRGBO(236, 64, 122, 1),
                          child: Text('error ${snap.error}'));
                    } else {
                      return Column(
                        children: [
                          SizedBox(
                            width: 360,
                            height: 144,
                            child: Image.network(
                              snap.data!.thumbnailUrl,
                              fit: BoxFit.scaleDown,
                              frameBuilder: ((context, child, frame,
                                  wasSynchronouslyLoaded) {
                                return child;
                                //if (wasSynchronouslyLoaded) return child;
                                //return Loader.animatedSwitcher(child, frame);
                              }),
                              errorBuilder: (_, o, stack) => Loader.blankIcon,
                            ),
                          ),
                          if (snap.data!.title.isNotEmpty)
                            Text('Title: ${snap.data!.title}'),
                          if (snap.data!.description.isNotEmpty)
                            Text('Description: ${snap.data!.description}'),
                          if (snap.data!.duration.isNotEmpty)
                            Text('Duration: ${snap.data!.duration}'),
                        ],
                      );
                    }
                  })
          ],
        ),
      ),
    );
  }
}

abstract class Loader {
  static Image get blankIcon => Image.memory(_blankBytes, height: 1);
}

final Uint8List _blankBytes = Uint8List.fromList([
  71,
  73,
  70,
  56,
  57,
  97,
  1,
  0,
  1,
  0,
  128,
  0,
  0,
  0,
  0,
  0,
  255,
  255,
  255,
  33,
  249,
  4,
  1,
  0,
  0,
  0,
  0,
  44,
  0,
  0,
  0,
  0,
  1,
  0,
  1,
  0,
  0,
  2,
  1,
  68,
  0,
  59
]);
