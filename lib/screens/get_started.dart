import 'package:flutter/material.dart';
import 'package:hotkey_flashcards/state/state.dart';
import 'package:hotkey_flashcards/widgets/get_started_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GetStarted extends HookWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flashCard = useProvider(stateProvider);

    return Scaffold(
      body: RawKeyboardListener(
        focusNode: flashCard.startNode,
        autofocus: true,
        onKey: (key) {
          flashCard.getStarted(key, context);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Test Your Keyboard Shortcuts Knowledge',
              style: Theme.of(context).textTheme.headline1),
              Text('for',
              style: Theme.of(context).textTheme.subtitle1,),
              Text('Android Studio'),

              /// Excel, VS Code, MS Word, general OS,
              GetStartedButton(),

              /// Will eventually have the option here to change which system you want to test
            ],
          ),
        ),
      ),
    );
  }
}
