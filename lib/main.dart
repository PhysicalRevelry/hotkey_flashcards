import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_flashcards/const/theme.dart';
import 'package:hotkey_flashcards/screens/flashcards.dart';
import 'package:hotkey_flashcards/screens/get_started.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme,
      routes: {
        '/getStarted': (context) => GetStarted(),
        '/flashcards': (context) => FlashCards(),
      },
      home: GetStarted(),
    );
  }
}
