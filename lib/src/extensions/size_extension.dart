import 'dart:ui' as ui;

extension SizeStringExtension on ui.Size {
  String get likeString => '${width.toInt()}x${height.toInt()}';

  ui.Size get swapped => ui.Size(height, width);
}

// \see Vector2PositionExtension
extension StringSizeExtension on String {
  /// Examples:
  ///   4096 => 4096x4096
  ///   "4096 3072"
  ///   "4096, 3072"
  ///   "4096 x 3072"
  ///   "4096x3072"
  ///   "4096 X 3072"
  ///   "4096X3072"
  /// \todo Rename `toGetter`s to `likeGetter`s for all extensions.
  ui.Size get likeSize {
    final s = trim();
    if (s.isEmpty) {
      return ui.Size.zero;
    }

    final l = s.split(RegExp('[ ,xX]+'));
    if (l.length == 1) {
      final x = double.tryParse(l.first);
      return x == null ? ui.Size.zero : ui.Size(x, x);
    }

    assert(
        l.length == 2,
        'String should be contains the numeric values'
        ' separated the spaces.'
        ' Has: `$l`');

    final sx = l[0];
    final x = double.tryParse(sx);
    assert(x != null, "Can't parse X from `$sx`");

    final sy = l[1];
    final y = double.tryParse(sy);
    assert(y != null, "Can't parse Y from `$sy`");

    return ui.Size(x ?? 0, y ?? 0);
  }
}
