import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:hotkey_flashcards/widgets/wrong.dart';

import 'correct.dart';

class VerdictWidget extends HookWidget {
  const VerdictWidget({Key key}) : super(key: key);

  @override
  // I want the verdict (right vs wrong icon) to not show if there is no key stroke yet
  Widget build(BuildContext context) {
    final flashCard = useProvider(stateProvider);
    return                   flashCard.keyedHotKey == null
        ? SizedBox( height: 2,)
        : flashCard.isRightHotKey(
        flashCard.target, flashCard.keyedHotKey)
        ? CorrectWidget()
        : WrongWidget();
  }
}
