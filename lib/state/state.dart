import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_flashcards/hotkeys/hotkeys.dart';
import 'dart:math';
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
  selectHotKey() {
    var rand = Random();
    HotKey newKeyToTest = listOfHotKeys[rand.nextInt(listOfHotKeys.length)];
    print(
        "Label for HotKey: ${newKeyToTest.label}, description: ${newKeyToTest.description}");
    target = newKeyToTest;
    notifyListeners();
  }

  void onKey(HotKey hotKey){
    keyedHotKey = hotKey;
    isSet = true;
    notifyListeners();
  }

  late Timer timer;
  exchangeWidget() {
    timer = Timer(const Duration(seconds: 3), () {
      selectHotKey();
      keyedHotKey = HotKey(label: '', description: '', keyName: '');
      isSet = false;
    });
  }

}
