import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_flashcards/const/theme.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GetStartedButton extends HookWidget {
  const GetStartedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flashCard = useProvider(stateProvider);
    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: () {
        flashCard.selectHotKey();
        Navigator.pushReplacementNamed(context, '/flashcards');
      },
      child: Text('Get Started'),
    );
  }
}
