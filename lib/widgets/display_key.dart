import 'package:flutter/material.dart';

class DisplayKey extends StatelessWidget {
  const DisplayKey({Key? key, required this.keyType}) : super(key: key);

  final String keyType;

  @override
  Widget build(BuildContext context) {
    return Text("$keyType + ",
    style: Theme.of(context).textTheme.subtitle1,);
  }
}
