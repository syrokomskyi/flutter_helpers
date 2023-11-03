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

  ui.Color brighten([int percent = 12]) {
    assert(1 <= percent && percent <= 100,
        'Percentage must be between 1 and 100.');

    final p = percent / 100;

    return ui.Color.fromARGB(
      alpha,
      red + ((255 - red) * p).round(),
      green + ((255 - green) * p).round(),
      blue + ((255 - blue) * p).round(),
    );
  }
}
