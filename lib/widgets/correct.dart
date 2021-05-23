import 'package:flutter/material.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CorrectWidget extends HookWidget {
  const CorrectWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flashcard = useProvider(stateProvider);
    return Container(
      child: Column(
        children: [
          Icon(
            Icons.check,
            color: Colors.green,
            size: 86,
          ),
          Text(flashcard.keyedHotKey.keyName),
          flashcard.keyedHotKey.alt ? Text("Alt") : SizedBox(height: 0),
          flashcard.keyedHotKey.control ? Text("Control") : SizedBox(height: 0),
          flashcard.keyedHotKey.meta
              ? Text("Option/Command")
              : SizedBox(height: 0),
          flashcard.keyedHotKey.shift ? Text("Shift") : SizedBox(height: 0),
        ],
      ),
    );
  }
}
