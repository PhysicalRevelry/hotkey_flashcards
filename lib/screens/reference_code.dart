import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class HotkeyFlashCards extends StatefulWidget {
  HotkeyFlashCards();

  @override
  _HotkeyFlashCardsState createState() => new _HotkeyFlashCardsState();
}

class _HotkeyFlashCardsState extends State<HotkeyFlashCards> {
  TextEditingController _controller = new TextEditingController();
  FocusNode _textNode = new FocusNode();

  @override
  initState() {
    super.initState();
  }

  //Handle when submitting
  void _handleSubmitted(String finalInput) {
    setState(() {
      SystemChannels.textInput
          .invokeMethod('TextInput.hide'); //hide keyboard again
      _controller.clear();
    });
  }

  // handleKey(RawKeyUpEvent key) {
  //   String _keyCode;
  //   _keyCode = key.logicalKey.keyLabel.toString(); //keycode of key event (66 is return)
  //   print("why does this run twice $_keyCode");
  // }

  handleKey(RawKeyEvent key) {
    if (key.runtimeType != RawKeyUpEvent) {
      return;
    }
    if (key.data is! RawKeyEventDataMacOs){
      return;
    }
    final event = key.data as RawKeyEventDataMacOs;
    print('key: ${event.physicalKey}, control: ${event.isControlPressed}, alt: ${event.isAltPressed}, meta: ${event.isMetaPressed}');

    RawKeyEventDataMacOs data = key.data as RawKeyEventDataMacOs;
    String _keyCode;
    _keyCode = data.keyCode.toString(); //keycode of key event (66 is return)

  }

  _buildTextComposer() {
    TextField _textField = new TextField(
      controller: _controller,
      onSubmitted: _handleSubmitted,
    );
    FocusScope.of(context).requestFocus(_textNode);
    return RawKeyboardListener(
        focusNode: _textNode,
        onKey: (key) => handleKey(key),
        child: _textField);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildTextComposer(),
    );
  }
}
