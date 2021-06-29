import 'package:flutter/material.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hotkey_flashcards/widgets/display_keystroke.dart';

import 'growing_icon.dart';

class CorrectWidget extends HookWidget {
  const CorrectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flashcard = useProvider(stateProvider);

    flashcard.exchangeWidget();
    return Container(
      child: Column(
        children: [
          GrowingIcon(
            color: Colors.green,
            icon: Icons.check,
          ),
          Text(
            flashcard.keyedHotKey.keyName,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          flashcard.keyNameToDisplayRight(context: context, keyCheck: flashcard.keyedHotKey.alt, displayText: "Alt"),
          flashcard.keyNameToDisplayRight(context: context, keyCheck: flashcard.keyedHotKey.control, displayText: "Control"),
          flashcard.keyNameToDisplayRight(context: context, keyCheck: flashcard.keyedHotKey.meta, displayText: "Option/Command"),
          flashcard.keyNameToDisplayRight(context: context, keyCheck: flashcard.keyedHotKey.shift, displayText: "Shift"),
          DisplayKeystroke(headline: "Correct!", displayKey: flashcard.keyedHotKey),
        ],
      ),
    );
  }
}

//TODO four lines of keystrokes could be a row widget that shows the keystroke icons as one would read them