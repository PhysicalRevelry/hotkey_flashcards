import 'package:flutter/material.dart';
import 'hotkeys.dart';

final commitCode = HotKey(
    label: 'Commit Code',
    description: 'Git is already set up and you want to make a commit',
    keyName: 'Key K',
    meta: true);
final doTheRightThing = HotKey(
    label: 'Do the right thing',
    description: 'Brings up a list of potential actions',
    keyName: 'Enter',
    meta: true);
final formatCode = HotKey(
    label: 'Format Code',
    description: 'Formats the code to more readable',
    keyName: 'Key L',
    alt: true,
    meta: true);
final getDocumentation = HotKey(
    label: 'Track Usage',
    description:
        'Finds variable or function usage or digs into element documentation',
    keyName: 'Key B',
    meta: true);
final refactorName = HotKey(
    label: 'Naming Refactor',
    description:
        'Change the name of a variable or class everywhere it is mentioned',
    keyName: 'F6',
    shift: true);
final selectCodeBlock = HotKey(
    label: 'Select a Block of Code',
    description: 'Select a block of code, increasing in scope with repetition',
    keyName: 'Arrow Up',
    alt: true);
final suggestAction = HotKey(
    label: 'Suggest an Action',
    description:
        'Like "do the right thing," it will bring up a menu of options',
    keyName: 'Space',
    meta: true);
final tabNavigation = HotKey(
    label: 'Tab Navigation',
    description:
        'Opens a menu to navigate to other open tabs, starting with most recent',
    keyName: 'Key E',
    meta: true);

final List<HotKey> listOfHotKeys = [
  commitCode,
  doTheRightThing,
  formatCode,
  getDocumentation,
  refactorName,
  selectCodeBlock,
  suggestAction,
  tabNavigation,
];
