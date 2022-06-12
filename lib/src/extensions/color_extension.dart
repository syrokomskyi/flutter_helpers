import 'dart:ui' as ui;

import 'package:dart_helpers/dart_helpers.dart';

const defaultColor = ui.Color(defaultColorInt);

/// \see `ColorIntExtension` from the project `dart_helpers`.
extension ColorExtension on int {
  ui.Color get toColor => ui.Color(this);
}

extension ColorColorExtension on ui.Color {
  String get colorToArgbString => value.colorIntToArgbString;
}
