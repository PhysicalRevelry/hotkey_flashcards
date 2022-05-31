import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainHeadline extends HookConsumerWidget {
  const MainHeadline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      'Enter Your Hotkey',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

// TODO take these "specific instances" and make them more generally usable