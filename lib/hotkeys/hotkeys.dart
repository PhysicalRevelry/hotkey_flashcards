class HotKey {
  final String label;
  final String description;
  final String keyName;
  final bool control;
  final bool alt;
  final bool meta;
  final bool shift;

  HotKey({
    required this.label,
    required this.description,
    required this.keyName,
    this.control = false,
    this.alt = false,
    this.meta = false,
    this.shift = false,
  });

  @override
  bool operator ==(Object? that) {
    if (that == null) {
      return false;
    }
    if (that is! HotKey) {
      return false;
    }
    if (this.keyName != that.keyName) {
      return false;
    } else if (this.meta != that.meta) {
      return false;
    } else if (this.control != that.control) {
      return false;
    } else if (this.alt != that.alt) {
      return false;
    } else if (this.shift != that.shift) {
      return false;
    } else {
      return true;
    }
  }

  @override
  String toString() {
    return "\n--------\nLabel: $label \nDescription: $description \nKeyname: $keyName \nConrol: ${control.toString()} \nAlt: ${alt.toString()} \nMeta: ${meta.toString()}\nShift: ${shift.toString()}\n--------";
  }
}

// 1) Create a list of all the keys
// 2) Pull a key at random from the list
// 3) When they get the right keystroke, it gets removed from the list
// 4) Pull another key at random from the list
// 5) etc.
// 6) Have a counter that keeps tabs of how many you've gotten right (X of 25)
// 7) Once all are done, hit a congratulations page.
