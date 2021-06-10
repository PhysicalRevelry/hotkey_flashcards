import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class MainHeadline extends HookWidget {
  const MainHeadline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Enter Your Hotkey',
      style: Theme.of(context).textTheme.headline1,
      // TextStyle(
        // fontWeight: FontWeight.bold,
        // fontSize: 42,
      // ),
    );
  }
}
