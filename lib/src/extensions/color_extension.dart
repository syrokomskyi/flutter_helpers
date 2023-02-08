import 'dart:ui' as ui;

import 'package:dart_helpers/dart_helpers.dart';

const defaultColor = ui.Color(defaultColorInt);

/// \see `ColorIntExtension` from the project `dart_helpers`.
extension ColorIntExtension on int {
  ui.Color get toColor => ui.Color(this);
}

extension ColorStringExtension on String {
  ui.Color get toColor => ui.Color(toColorInt);
}

extension ColorColorExtension on ui.Color {
  String get colorToArgbString => value.colorIntToArgbString;
}
