import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainHeadline extends HookWidget {
  const MainHeadline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Enter Your Hotkey',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

// TODO take these "specific instances" and make them more generally usable