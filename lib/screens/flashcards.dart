import 'package:flutter/material.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hotkey_flashcards/widgets/choose_verdict.dart';
import 'package:hotkey_flashcards/widgets/display_target.dart';

class FlashCards extends HookWidget {
  const FlashCards({Key? key}) : super(key: key);

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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'ENTER YOUR HOTKEY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 42,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  Expanded(
                    flex: 1,
                    child: DisplayTarget(),
                  ),
                  //TODO Also a widget,
                  Expanded(
                    flex: 2,
                    child: VerdictWidget(),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
