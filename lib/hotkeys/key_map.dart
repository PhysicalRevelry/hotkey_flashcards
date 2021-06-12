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
final expandEditor = HotKey(
    label: 'Expand Editor',
    description:
    'Maximizes and minimizes the editing window by showing or hiding the side navigation',
    keyName: 'F12',
    meta: true,
    shift: true);
final fileNavigation = HotKey(
    label: 'File Navigation',
    description:
    'Opens a menu to navigate to recently open tabs or other files and folders, starting with most recent',
    keyName: 'Key E',
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
final saveAll = HotKey(
    label: 'Save',
    description: 'Save everything you\'ve done up to that point',
    keyName: 'Key S',
    control: true);
/// Search Everywhere is a double shift, not sure how to even code that!
/// But it's such a cool shortcut to have!
// final searchEverywhere = HotKey(label: 'Search Everywhere',
//     description: 'Search everywhere across the IntelliJ IDE',
//     keyName: '',);
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
    control: true);
final tabNavigation = HotKey(
    label: 'Tab Navigation',
    description:
    'Navigate between open tabs, with more recently used tabs at the top of the list',
    keyName: 'Key E',
    control: true);

final List<HotKey> listOfHotKeys = [
  commitCode,
  doTheRightThing,
  expandEditor,
  fileNavigation,
  formatCode,
  getDocumentation,
  refactorName,
  saveAll,
  selectCodeBlock,
  suggestAction,
  tabNavigation,
];
