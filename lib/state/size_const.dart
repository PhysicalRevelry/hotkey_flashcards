import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final transitionsProvider = ChangeNotifierProvider<Transitions>((ref) {
  return Transitions();
});

class Transitions extends ChangeNotifier {
  double size = 50.0;
  bool large = false;

  void updateSize() {
    size = large ? 250.0 : 100.0;
    large = !large;
  }
}