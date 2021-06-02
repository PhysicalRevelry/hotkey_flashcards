import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ShowKeyStrokes extends HookWidget {
  const ShowKeyStrokes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flashCard = useProvider(stateProvider);
    return Column(
      children: [
        Text('Key Name: ${flashCard.keyedHotKey!.keyName}'),
        Text('Shift: ${flashCard.keyedHotKey!.shift}'),
        Text('Control: ${flashCard.keyedHotKey!.control}'),
        Text('Alt: ${flashCard.keyedHotKey!.alt}'),
        Text('Meta/Command: ${flashCard.keyedHotKey!.meta}'),
      ],
    );
  }
}
