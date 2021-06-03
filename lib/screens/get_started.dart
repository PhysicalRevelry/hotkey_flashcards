import 'package:flutter/material.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:hotkey_flashcards/widgets/get_started_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GetStarted extends HookWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flashCard = useProvider(stateProvider);

    return Scaffold(
      body: RawKeyboardListener(
        focusNode: flashCard.textNode,
        autofocus: true,
        onKey: (key) {
          flashCard.getStarted(key, context);
          flashCard.selectHotKey();
        },
        child: Center(child: GetStartedButton()),
      ),
    );
  }
}
