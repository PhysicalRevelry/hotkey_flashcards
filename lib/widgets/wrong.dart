import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:hotkey_flashcards/widgets/display_keystroke.dart';
import 'package:hotkey_flashcards/widgets/growing_icon.dart';

class WrongWidget extends HookConsumerWidget {
  const WrongWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcard = ref.watch(stateProvider);
    return Container(
      child: Column(
        children: [
          GrowingIcon(
            icon: Icons.clear,
            color: Colors.red,
          ),
          DisplayKeystroke(headline: "You Pressed:", displayKey: flashcard.keyedHotKey),

          DisplayKeystroke(headline: "You Need:", displayKey: flashcard.target!)
        ],
      ),
    );
  }
}
