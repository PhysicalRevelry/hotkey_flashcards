import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DisplayTarget extends HookWidget {
  const DisplayTarget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flashCard = useProvider(stateProvider);
    return Column(
      children: [
        Text(
          flashCard.target == null
              ? " "
              : "${flashCard.target!.label}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(height: 30,),
        Text(flashCard.target == null
            ? " "
            : "${flashCard.target!.description}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        )
      ],
    );
  }
}
