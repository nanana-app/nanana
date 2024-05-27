import 'dart:io';

// import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:nanana_app/src/app/dir_config.dart';
import 'package:path/path.dart' as path;
// import 'package:permission_handler/permission_handler.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeView extends StatefulWidget {
  YoutubeView({super.key, required this.title});

  final String title;

  @override
  _YoutubeViewState createState() => _YoutubeViewState();
}

class _YoutubeViewState extends State<YoutubeView> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Insert the video id or url',
            ),
            TextField(controller: textController),
            ElevatedButton(
              child: const Text('Download'),
              onPressed: () async {
                // Here you should validate the given input or else an error
                // will be thrown.
                final yt = YoutubeExplode();
                final id = VideoId(textController.text.trim());
                final video = await yt.videos.get(id);

                // Display info about this video.
                await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                        'Title: ${video.title}, Duration: ${video.duration}',
                      ),
                    );
                  },
                );

                // Request permission to write in an external directory.
                // (In this case downloads)
                // await Permission.storage.request();

                // Get the streams manifest and the audio track.
                final manifest = await yt.videos.streamsClient.getManifest(id);

                final audio = manifest.audioOnly.withHighestBitrate();
                // yt.videos.streamsClient.get(audio).pipe(streamConsumer)
                // Build the directory.
                final fileName = '${video.id}.${audio.container.name}'
                    .replaceAll(r'\', '')
                    .replaceAll('/', '')
                    .replaceAll('*', '')
                    .replaceAll('?', '')
                    .replaceAll('"', '')
                    .replaceAll('<', '')
                    .replaceAll('>', '')
                    .replaceAll('|', '');
                final filePath = path.join(
                  DirConfig.songsFilesDir.uri.toFilePath(),
                  fileName,
                );

                // Open the file to write.
                final file = File(filePath);
                if (file.existsSync()) {
                  file.deleteSync();
                }

                // Open the file in writeAppend.
                final output = file.openWrite(mode: FileMode.writeOnlyAppend);

                // Pipe all the content of the stream into our file.
                // await yt.videos.streamsClient.get(audio).pipe(fileStream);
                /*
                  If you want to show a % of download, you should listen
                  to the stream instead of using `pipe` and compare
                  the current downloaded streams to the totalBytes,
                  see an example ii example/video_download.dart
                   */
// Track the file download status.
                final len = audio.size.totalBytes;
                var count = 0;

                // Create the message and set the cursor position.
                final msg =
                    'Downloading ${video.title}.${audio.container.name}';
                stdout.writeln(msg);

                // Listen for data received.
                await for (final data in yt.videos.streamsClient.get(audio)) {
                  // Keep track of the current downloaded data.
                  count += data.length;

                  // Calculate the current progress.
                  final progress = ((count / len) * 100).ceil();

                  print(progress.toStringAsFixed(2));

                  // Write to file.
                  output.add(data);
                }
                await output.close();
                // // Show that the file was downloaded.
                print(filePath);
                await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content:
                          Text('Download completed and saved to: $filePath'),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
