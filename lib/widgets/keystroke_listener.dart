import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class KeystrokeListener extends HookWidget {
  final Widget child;
  KeystrokeListener({required this.child});
  @override
  Widget build(BuildContext context) {
    final flashCard = useProvider(stateProvider);
    return FocusScope(
      autofocus: true,
      child: Focus(
        onKey: (data, event) {
          flashCard.handleKey(event);
          return true;
        },
        child: child,
      ),
    );
  }
}