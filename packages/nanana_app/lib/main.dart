import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nanana_app/src/app/a_app_doc_dir.dart';
import 'package:nanana_app/src/app/ze_stuff.dart';

import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';

void main() async {
  if (Platform.isAndroid) {
    ByteData data = await PlatformAssetBundle()
        .load('assets/certificates/lets-encrypt-r3.pem');
    SecurityContext.defaultContext
        .setTrustedCertificatesBytes(data.buffer.asUint8List());
  }
  await SentryFlutter.init(
    (options) {
      options.dsn = ''; // TODO complete this with sentry dns
      //options.tracesSampleRate = 1.0;
      options.reportPackages = false;
      options.addInAppInclude('nanana');
      options.considerInAppFramesByDefault = false;
      options.attachThreads = true;
      options.enableWindowMetricBreadcrumbs = true;
      options.addIntegration(LoggingIntegration());
    },
    appRunner: () => runApp(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: AppDocDirectory(Environment.normal),
      ),
    ),
  );
}
