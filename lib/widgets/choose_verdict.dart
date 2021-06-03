import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_flashcards/hotkeys/key_map.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:hotkey_flashcards/widgets/wrong.dart';

import 'correct.dart';

class VerdictWidget extends HookWidget {
  const VerdictWidget({Key? key}) : super(key: key);

  @override
  // I want the verdict (right vs wrong icon) to not show if there is no key stroke yet
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

// if the user hasn't attempted a hotkey yet, show the empty widget
// once the user attempts a hotkey, show either Correct or Wrong widget