import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hotkey_flashcards/widgets/display_keystroke.dart';

import 'growing_icon.dart';

class CorrectWidget extends HookConsumerWidget {
  const CorrectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcard = ref.watch(stateProvider);

    flashcard.exchangeWidget();


    return Container(
      child: Column(
        children: [
          GrowingIcon(
            color: Colors.green,
            icon: Icons.check,
          ),
          DisplayKeystroke(headline: "Correct!", displayKey: flashcard.keyedHotKey),
        ],
      ),
    );

  }

}

