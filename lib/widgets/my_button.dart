import 'package:flutter/material.dart';
import 'package:hotkey_flashcards/const/theme.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.onPressed, required this.label})
      : super(key: key);

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
