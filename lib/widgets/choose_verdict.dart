import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:hotkey_flashcards/widgets/wrong.dart';

import 'correct.dart';

class VerdictWidget extends HookWidget {
  const VerdictWidget({Key? key}) : super(key: key);

  @override
  // if the user hasn't attempted a hotkey yet, show the empty widget
  // once the user attempts a hotkey, show either Correct or Wrong widget
  Widget build(BuildContext context) {
    final flashCard = useProvider(stateProvider);
    if (!flashCard.isSet){
      return SizedBox(height: 2);
    }
    if (!flashCard.isRightHotKey(flashCard.target!, flashCard.keyedHotKey)){
      return WrongWidget();
    }
    return CorrectWidget();
  }
}

