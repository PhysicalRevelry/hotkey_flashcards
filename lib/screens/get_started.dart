import 'package:flutter/material.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_flashcards/widgets/keystroke_listener.dart';
import 'package:hotkey_flashcards/widgets/my_button.dart';

//TODO Figure out how to get rid of the BLOOP on keystrokes

class GetStarted extends HookConsumerWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashCard = ref.watch(stateProvider);

    final onClick = () {
      Navigator.pushReplacementNamed(context, '/flashcards');
      // Navigator.of(context).pushReplacementNamed('/flashcards');
      print("Button Pressed");
      flashCard.selectHotKey();
    };

    return Scaffold(
      body: KeystrokeListener(
        onKey:(key) {
          if (key.keyName == "Enter" || key.keyName == "Numpad Enter"){
            Navigator.pushReplacementNamed(context, "/flashcards");
            flashCard.selectHotKey();
          }
        },
        child: RawKeyboardListener(
          focusNode: flashCard.textNode,
          autofocus: true,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Test Your Keyboard Shortcuts Knowledge',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                Text('for', style: Theme.of(context).textTheme.bodyText1),
                Text(
                  'Android Studio',
                  style: Theme.of(context).textTheme.subtitle2,
                ),

                /// Excel, VS Code, MS Word, general OS,
                Tooltip(
                    message: 'Press Enter to Begin',
                    child: MyButton(onPressed: onClick, label: 'Get Started')),

                /// Will eventually have the option here to change which system you want to test
              ],
            ),
          ),
        ),
      ),
    );
  }
}
