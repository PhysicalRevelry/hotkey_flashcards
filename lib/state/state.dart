import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_flashcards/hotkeys/hotkeys.dart';
import 'dart:math';
import 'package:flutter/services.dart';

import 'package:hotkey_flashcards/hotkeys/key_map.dart';

final stateProvider = ChangeNotifierProvider<State>((ref){
  return State();
});

class State extends ChangeNotifier {
  final textController = TextEditingController();
  FocusNode textNode = FocusNode();


  // returning a random HotKey to test from the list. Currently cast as a string.
  String selectHotKey(){
    var rand = Random();
    HotKey newKeyToTest = listOfHotKeys[rand.nextInt(listOfHotKeys.length)];
    print("Next hot key is ${newKeyToTest.label} at index ${rand.nextInt(listOfHotKeys.length)}");
    print("Label for HotKey: ${newKeyToTest.label}, description: ${newKeyToTest.description}");
    return newKeyToTest.label;
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
    print(
        'key: ${event.physicalKey.debugName}, control: ${event.isControlPressed}, alt: ${event.isAltPressed}, meta: ${event.isMetaPressed}, shift: ${event.isShiftPressed}');

    RawKeyEventDataMacOs data = key.data as RawKeyEventDataMacOs;
    String _keyCode;
    _keyCode = data.keyCode.toString(); //keycode of key event (66 is return)
  }

  HotKey createTestHotKey (event){

  }

}
