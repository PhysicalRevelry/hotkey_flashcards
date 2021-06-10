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
          flashcard.keyedHotKey.alt ? Text("Alt") : SizedBox(height: 0),
          flashcard.keyedHotKey.control ? Text("Control") : SizedBox(height: 0),
          flashcard.keyedHotKey.meta
              ? Text("Option/Command")
              : SizedBox(height: 0),
          flashcard.keyedHotKey.shift ? Text("Shift") : SizedBox(height: 0),
          Text(
            'You need: ',
            style: Theme.of(context).textTheme.subtitle1,
          ), //TODO need some styling for readability
          Text(flashcard.target!.keyName),
          flashcard.target!.alt ? Text("Alt") : SizedBox(height: 0),
          flashcard.target!.control ? Text("Control") : SizedBox(height: 0),
          flashcard.target!.meta ? Text("Option/Command") : SizedBox(height: 0),
          flashcard.target!.shift ? Text("Shift") : SizedBox(height: 0),
        ],
      ),
    );
  }
}
