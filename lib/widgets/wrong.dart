import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:hotkey_flashcards/widgets/growing_icon.dart';

class WrongWidget extends HookWidget {
  const WrongWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flashcard = useProvider(stateProvider);
    return Container(
      child: Column(
        children: [
          GrowingIcon(
            icon: Icons.clear,
            color: Colors.red,
          ),
          Text(
            'You keyed: ',
            style: Theme.of(context).textTheme.subtitle1,
          ), //TODO need some styling for readability
          Text(
            flashcard.keyedHotKey.keyName,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          flashcard.keyNameToDisplayWrong(context: context, keyCheck: flashcard.keyedHotKey.alt, displayText: "Alt"),
          flashcard.keyNameToDisplayWrong(context: context, keyCheck: flashcard.keyedHotKey.control, displayText: "Control"),
          flashcard.keyNameToDisplayWrong(context: context, keyCheck: flashcard.keyedHotKey.meta, displayText: "Option/Command"),
          flashcard.keyNameToDisplayWrong(context: context, keyCheck: flashcard.keyedHotKey.shift, displayText: "Shift"),

          Text(
            'You need: ',
            style: Theme.of(context).textTheme.subtitle1,
          ), //TODO need some styling for readability
          Text(
            flashcard.target!.keyName,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          flashcard.keyNameToDisplayWrong(context: context, keyCheck: flashcard.target!.alt, displayText: "Alt"),
          flashcard.keyNameToDisplayWrong(context: context, keyCheck: flashcard.target!.control, displayText: "Control"),
          flashcard.keyNameToDisplayWrong(context: context, keyCheck: flashcard.target!.meta, displayText: "Option/Command"),
          flashcard.keyNameToDisplayWrong(context: context, keyCheck: flashcard.target!.shift, displayText: "Shift"),
        ],
      ),
    );
  }
}
//TODO maybe more components in here so it's not so long. the "you keyed" and "you need" could be same widget?
