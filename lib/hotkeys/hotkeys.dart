import 'package:flutter/material.dart';

class HotKey {
  final String label;
  final String description;
  final String keyName;
  final bool control;
  final bool alt;
  final bool meta;
  final bool shift;

  HotKey({
    @required this.label,
    @required this.description,
    @required this.keyName,
    this.control = false,
    this.alt = false,
    this.meta = false,
    this.shift = false,
  });
}

