import 'package:flutter/material.dart';

// import 'package:hotkey_flashcards/hotkeys/hotkeys.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hotkey_flashcards/widgets/choose_verdict.dart';

class FlashCards extends HookWidget {
  const FlashCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flashCard = useProvider(stateProvider);
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
                      child: Text('Get Started')),
                  //TODO Make this a widget
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    flashCard.target == null
                        ? " "
                        : "${flashCard.target.label}\n\n${flashCard.target.description}",
                    textAlign: TextAlign.center,
                  ),
                  //TODO Also a widget
                  Text(
                    'ENTER YOUR HOTKEY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 42,
                    ),
                  ),
                  VerdictWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
