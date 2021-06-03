import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainHeadline extends HookWidget {
  const MainHeadline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'ENTER YOUR HOTKEY',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 42,
      ),
    );
  }
}
