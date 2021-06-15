import 'hotkeys.dart';

final commentOut = HotKey(
    label: 'Comment Out Line',
    description:
        'Comments out a line or block of code or removes the comment slashes to activate commented code',
    keyName: 'Slash',
    meta: true);
//TODO what is the keyname for the slash??
final commitCode = HotKey(
    label: 'Commit Code',
    description: 'Git is already set up and you want to make a commit',
    keyName: 'Key K',
    meta: true);
final completeStatement = HotKey(
    label: 'Complete Statement',
    description:
        'Can finish your statement such as putting the final semicolon or even finishing the syntax for a for loop or if statement',
    keyName: "Enter",
    shift: true,
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
    label: 'Find Usage',
    description:
        'Finds variable or function usage or digs into element documentation',
    keyName: 'Key B',
    meta: true);
final navigateErrors = HotKey(
    label: 'Navigate Errors',
    description: 'Navigate between errors in a file',
    keyName: 'F2');
final projectFolder = HotKey(
    label: 'Project Folder Navigation',
    description:
        'Opens and focuses on project folder so you can navigate using arrow keys, or closes project folder and focuses your editor',
    keyName: 'Digit 1',
    meta: true);
final refactorName = HotKey(
    label: 'Naming Refactor',
    description:
        'Change the name of a variable or class everywhere it is mentioned',
    keyName: 'F6',
    shift: true);
final refactorThis = HotKey(
    label: 'Refactor This',
    description:
        'Refactor the element under the caret, for example, safe delete, copy, move, rename, and so on',
    keyName: 'Key T',
    control: true);
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
  completeStatement,
  doTheRightThing,
  expandEditor,
  fileNavigation,
  formatCode,
  getDocumentation,
  navigateErrors,
  refactorName,
  refactorThis,
  saveAll,
  selectCodeBlock,
  suggestAction,
  tabNavigation,
];
