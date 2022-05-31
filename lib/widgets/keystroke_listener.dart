import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotkey_flashcards/hotkeys/hotkeys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_flashcards/state/state.dart';

class KeystrokeListener extends HookConsumerWidget {
  final Widget child;

  final void Function(HotKey value) onKey;

  KeystrokeListener({required this.child, required this.onKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcard = ref.watch(stateProvider);
    return FocusScope(
      autofocus: true,
      child: Focus(
        onKey: (data, event) {
          if (event.runtimeType == RawKeyUpEvent) {
            return KeyEventResult.handled;
          }
          if (event.runtimeType == RawKeyDownEvent) {
            flashcard.testHotKey =
                createTestHotKey(event.data as RawKeyEventDataMacOs);
          }

          final data = event.data as RawKeyEventDataMacOs;

          if (modifierCheck(data.logicalKey.debugName)) {
            return KeyEventResult.handled;
          }

          onKey(flashcard.testHotKey!);
          return KeyEventResult.handled;
        },
        child: child,
      ),
    );
  }

  List<String> modifierKeys = [
    'Meta Right',
    'Meta Left',
    'Alt Left',
    'Alt Right',
    'Control Left',
    'Control Right',
    'Shift Left',
    'Shift Right',
  ];

  bool modifierCheck(String? key){
    if (modifierKeys.contains(key)){
      return true;
    }
    return false;
  }

  HotKey createTestHotKey(RawKeyEventDataMacOs event) {
    HotKey testHotKey = HotKey(
        label: 'Tester',
        description: 'to test against',
        keyName: event.logicalKey.debugName!,
        alt: event.isAltPressed,
        control: event.isControlPressed,
        meta: event.isMetaPressed,
        shift: event.isShiftPressed);
    // print(testHotKey.toString());
    return testHotKey;
  }
}
