import 'package:flutter/material.dart';
import 'package:hotkey_flashcards/hotkeys/hotkeys.dart';

Widget showResult(HotKey hotKey, BuildContext context) {
  return AlertDialog(
    title: Text("You pressed this combination:"),
    content: SingleChildScrollView(
      child: Column(
        children: [
          Text(hotKey.label),
          Text(hotKey.keyName),
          Text("Is Alt Pressed: ${hotKey.alt}"),
          Text("Is Control Pressed: ${hotKey.control}"),
          Text("Is Meta Pressed: ${hotKey.meta}"),
          Text("Is Shift Pressed: ${hotKey.shift}"),
        ],
      ),
    ),
    actions: [
      TextButton(
        child: Text("OKAY"),
        onPressed: () => Navigator.pop(context),
      )
    ],
  );
}
