import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotkey_flashcards/hotkeys/hotkeys.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class KeystrokeListener extends HookWidget {
  final Widget child;

  final void Function(HotKey value) onKey;

  KeystrokeListener({required this.child, required this.onKey});
  @override
  Widget build(BuildContext context) {
    return FocusScope(
      autofocus: true,
      child: Focus(
        onKey: (data, event) {
          if (event.runtimeType != RawKeyUpEvent) {
            return true;
          }
          if (event.data is! RawKeyEventDataMacOs) {
            return true;
          }
          final data = event.data as RawKeyEventDataMacOs;

          if (!isMetaKey(data.physicalKey.debugName)) {
            final hotKey = createTestHotKey(data);
            onKey(hotKey);
            return false;
          }

          return true;
        },
        child: child,
      ),
    );
  }

  bool isMetaKey(String? key) {
    switch (key) {
      case "Meta Right":
        {
          return true;
        }
      case "Meta Left":
        {
          return true;
        }
      case "Alt Left":
        {
          return true;
        }
      case "Alt Right":
        {
          return true;
        }
      case "Control Left":
        {
          return true;
        }
      case "Control Right":
        {
          return true;
        }
      case "Shift Right":
        {
          return true;
        }
      case "Shift Left":
        {
          return true;
        }
    }
    return false;
  }

  HotKey createTestHotKey(RawKeyEventDataMacOs event) {
    HotKey testHotKey = HotKey(
        label: 'Tester',
        description: 'to test against',
        keyName: event.physicalKey.debugName!,
        alt: event.isAltPressed,
        control: event.isControlPressed,
        meta: event.isMetaPressed,
        shift: event.isShiftPressed);
    return testHotKey;
  }
}