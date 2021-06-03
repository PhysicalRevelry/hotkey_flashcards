import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_flashcards/hotkeys/hotkeys.dart';
import 'dart:math';
import 'package:flutter/services.dart';

import 'package:hotkey_flashcards/hotkeys/key_map.dart';

final stateProvider = ChangeNotifierProvider<State>((ref) {
  return State();
});

class State extends ChangeNotifier {
  FocusNode textNode = FocusNode();
  late HotKey? target;
  HotKey keyedHotKey = HotKey(label: "", description: "", keyName: "");

  // returning a random HotKey to test from the list. Currently cast as a string.
  selectHotKey() {
    var rand = Random();
    HotKey newKeyToTest = listOfHotKeys[rand.nextInt(listOfHotKeys.length)];
    print(
        "Next hot key is ${newKeyToTest.label} at index ${rand.nextInt(listOfHotKeys.length)}");
    print(
        "Label for HotKey: ${newKeyToTest.label}, description: ${newKeyToTest.description}");
    target = newKeyToTest;
    notifyListeners();
  }

  // Parsing the keystrokes
  handleKey(RawKeyEvent key) {
    if (key.runtimeType != RawKeyUpEvent) {
      return;
    }
    if (key.data is! RawKeyEventDataMacOs) {
      return;
    }
    final event = key.data as RawKeyEventDataMacOs;

    if (!isMetaKey(event.physicalKey.debugName)) {
      keyedHotKey = createTestHotKey(event);
      notifyListeners();
    } else {
      return;
    }
    print("You got your test hot key right here: ${keyedHotKey.label}, "
        "\n debug name: ${keyedHotKey.keyName} "
        "\n is alt pressed? ${keyedHotKey.alt} "
        "\n is control pressed? ${keyedHotKey.control} "
        "\n is meta pressed? ${keyedHotKey.meta}"
        "\n is shift pressed? ${keyedHotKey.shift}");
    return keyedHotKey;
  }

  // Testing the entered key combo against the target combo
  bool isRightHotKey(HotKey target, HotKey test) {
    if (test == null || target == null) {
      return false;
    } else if (target.keyName != test.keyName) {
      return false;
    } else if (target.meta != test.meta) {
      return false;
    } else if (target.control != test.control) {
      return false;
    } else if (target.alt != test.alt) {
      return false;
    } else if (target.shift != test.shift) {
      return false;
    } else {
      return true;
    }
  }

  //
  getStarted(RawKeyEvent key, BuildContext context) {
    final event = key.data as RawKeyEventDataMacOs;

    if (event.physicalKey.debugName == "Enter" ||
        event.physicalKey.debugName == "Numpad Enter") {
      Navigator.pushNamed(context, "/flashcards");
    }
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

  late Timer timer;
  exchangeWidget() {
    timer = Timer(const Duration(seconds: 3), () {
      selectHotKey();
      keyedHotKey = HotKey(label: '', description: '', keyName: '');
    });
  }
}
