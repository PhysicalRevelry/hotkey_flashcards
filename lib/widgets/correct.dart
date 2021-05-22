import 'package:flutter/material.dart';

class CorrectWidget extends StatelessWidget {
  const CorrectWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.check,
        color: Colors.green,
        size: 42,
      ),
    );
  }
}
