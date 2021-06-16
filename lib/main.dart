import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_flashcards/const/theme.dart';
import 'package:hotkey_flashcards/screens/flashcards.dart';
import 'package:hotkey_flashcards/screens/get_started.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // setWindowTitle('App title');
    setWindowMinSize(const Size(700, 700));
    setWindowMaxSize(Size.infinite);
  }
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
