import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nanana_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // supportedLocales: ,
      debugShowCheckedModeBanner: false,
      home: const HomeView(
        song: 'Mandjou',
        artist: 'Salif Keita',
        language: 'Malinké',
      ),
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}
