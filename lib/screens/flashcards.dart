import 'package:flutter/material.dart';
import 'package:hotkey_flashcards/hotkeys/hotkeys.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hotkey_flashcards/widgets/alert_dialog.dart';

class FlashCards extends HookWidget {
  const FlashCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flashCard = useProvider(stateProvider);
    HotKey testKey;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 100),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("What's the hot key for this function?"),
                Text(
                    'This will be the HotKey name: ${flashCard.selectHotKey()}'),
                // TextField(
                //   controller: flashCard.textController,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: 'Enter hotkey combo',
                //   ),
                //   onSubmitted: (keys){},
                // ),
                Text(
                  'ENTER YOUR HOTKEY',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                  ),
                ),
                RawKeyboardListener(
                  focusNode: flashCard.textNode,
                  onKey: (key) {
                    testKey = flashCard.handleKey(key);
                    if (testKey != null) {
                      showResult(testKey, context);
                    }
                  },
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (key) {
                      // showResult(testKey, context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
