import 'package:flutter/material.dart';
import 'package:hotkey_flashcards/const/keyboard_symbols.dart';
import 'package:hotkey_flashcards/hotkeys/hotkeys.dart';
import 'package:hotkey_flashcards/widgets/display_key.dart';



class DisplayKeystroke extends StatelessWidget {
  const DisplayKeystroke(
      {Key? key, required this.headline, required this.displayKey})
      : super(key: key);

  final String headline;
  final HotKey displayKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          headline,
          style: Theme.of(context).textTheme.headline1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             displayKey.control ? DisplayKey(keyType: KeyboardSymbols.control,): Text(''),
             displayKey.alt ? DisplayKey(keyType: KeyboardSymbols.alt): Text(''),
             displayKey.meta ? DisplayKey(keyType: KeyboardSymbols.option): Text(''),
             displayKey.shift ? DisplayKey(keyType: KeyboardSymbols.shift): Text(''),
            Text(displayKey.keyName, style: Theme.of(context).textTheme.subtitle1),
          ],
        ),
      ],
    );
  }
}

