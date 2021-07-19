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
  FocusNode textNode = FocusNode(onKey: (node, event) => true);
  late HotKey? target;
  HotKey keyedHotKey = HotKey(label: "", description: "", keyName: "");
  bool isSet = false;

  // returning a random HotKey to test from the list. Currently cast as a string.
  /// HOTKEY class?
  selectHotKey() {
    var rand = Random();
    HotKey newKeyToTest = listOfHotKeys[rand.nextInt(listOfHotKeys.length)];
    print(
        "Label for HotKey: ${newKeyToTest.label}, description: ${newKeyToTest.description}");
    target = newKeyToTest;
    notifyListeners();
  }
  /// Stay here
  // Parsing the keystrokes in the game
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
      isSet = true;
      notifyListeners();
    } else {
      return;
    }

    return keyedHotKey;
  }

  // Listens for the Enter key to be hit to advance to next page
  getStarted(RawKeyEvent key, BuildContext context) {
    if (key.runtimeType != RawKeyUpEvent) {
      return;
    }

    final event = key.data as RawKeyEventDataMacOs;
    if (event.physicalKey.debugName == "Enter" ||
        event.physicalKey.debugName == "Numpad Enter") {
      Navigator.pushReplacementNamed(context, "/flashcards");
    }
    selectHotKey();
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

  /// HOTKEY class?
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
      isSet = false;
    });
  }

  /// Brand new class? Class DisplayWidget Handler?
  Widget keyNameToDisplayWrong(
      {required BuildContext context, required bool keyCheck, required String displayText}){
    if (keyCheck){
      return Text(
        displayText,
        style: Theme.of(context).textTheme.bodyText1,
      );
    } else {
      return SizedBox(height: 0);
    }
  }

  /// Brand new class? Class DisplayWidget Handler?
  Widget keyNameToDisplayRight(
      {required BuildContext context, required bool keyCheck, required String displayText}){
    if (keyCheck){
      return Text(
        displayText,
        style: Theme.of(context).textTheme.subtitle1,
      );
    } else {
      return SizedBox(height: 0);
    }
  }

}
