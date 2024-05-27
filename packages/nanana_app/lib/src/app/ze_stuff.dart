import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Environment {
  final String _env;
  const Environment._(this._env);
  const Environment.custom(this._env);

  static const Environment normal = Environment._('normal');
  static const Environment dev = Environment._('dev');
  static const Environment unknown = Environment._('unknown');

  @override
  String toString() => _env;

  static Environment tryParse(String val) {
    switch (val) {
      case 'dev':
        return Environment.dev;
      case 'normal':
        return Environment.normal;
      default:
        print('$val is not a valid Environment');
        return Environment.unknown;
    }
  }
}

Future<void> playJingle() async {
  final player = AudioPlayer();
  player.setVolume(0.5);

  player
      .setAsset(
          'assets/sounds/digital-technology-drop-logo-2-BreakzStudios.mp3')
      .then((_) => player.play().then((_) => player.dispose()));
  return;
}

class ColoredBoxNanana {
  static const greyWithCircularProgressIndic = ColoredBox(
    color: Colors.grey,
    child: Center(child: CircularProgressIndicator()),
  );
}

/// Wrap builder to report errors
class FutureBuilder2<T> extends FutureBuilder<T> {
  FutureBuilder2({
    super.key,
    super.future,
    super.initialData,
    required AsyncWidgetBuilder<T> builder,
  }) : super(builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (snapshot.hasError) {
            FlutterError.reportError(FlutterErrorDetails(
                exception: snapshot.error!, stack: snapshot.stackTrace));
          }
          return builder(context, snapshot);
        });
}
