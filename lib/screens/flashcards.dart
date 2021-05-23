import 'package:flutter/material.dart';
// import 'package:hotkey_flashcards/hotkeys/hotkeys.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hotkey_flashcards/widgets/show_key_stroke.dart';
import 'package:hotkey_flashcards/widgets/correct.dart';
import 'package:hotkey_flashcards/widgets/wrong.dart';

class FlashCards extends HookWidget {
  const FlashCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flashCard = useProvider(stateProvider);
    // HotKey testKey;
    return Scaffold(
      body: RawKeyboardListener(
        focusNode: flashCard.textNode,
        autofocus: true,
        onKey: (key) {
          flashCard.handleKey(key);
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => flashCard.selectHotKey(),
                      child: Text('Get Started')), //TODO Make this a widget
                  SizedBox(
                    height: 30,
                  ),
                  Text(flashCard.target == null
                      ? " "
                      : "${flashCard.target.label}\n\n${flashCard.target.description}"), //TODO Also a widget
                  Text(
                    'ENTER YOUR HOTKEY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 42,
                    ),
                  ),
                  // flashCard.keyedHotKey != null ? ShowKeyStrokes() : Text(" "),
                  flashCard.isRightHotKey(
                          flashCard.target, flashCard.keyedHotKey)
                      ? CorrectWidget()
                      : WrongWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

bool isCorrect() {
  return true;
}
