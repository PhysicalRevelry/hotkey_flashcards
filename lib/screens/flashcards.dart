import 'package:flutter/material.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hotkey_flashcards/widgets/choose_verdict.dart';
import 'package:hotkey_flashcards/widgets/display_target.dart';
import 'package:hotkey_flashcards/widgets/keystroke_listener.dart';
import 'package:hotkey_flashcards/widgets/main_headline.dart';

class FlashCards extends HookWidget {
  const FlashCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flashCard = useProvider(stateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Keyboard Shortcut Flashcards'),
      ),
      body: KeystrokeListener(
        child: RawKeyboardListener(
          focusNode: flashCard.textNode,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(child: MainHeadline()),
                  ),
                  Expanded(
                    flex: 1,
                    child: DisplayTarget(),
                  ),
                  Expanded(
                    flex: 2,
                    child: VerdictWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
