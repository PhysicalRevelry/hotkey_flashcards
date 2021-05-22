import 'package:flutter/material.dart';

class WrongWidget extends StatelessWidget {
  const WrongWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.clear,
        color: Colors.red,
        size: 42,
      ),
    );
  }
}
