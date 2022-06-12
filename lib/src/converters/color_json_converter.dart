import 'package:dart_helpers/dart_helpers.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

import '../extensions/color_extension.dart';

class ColorJsonConverter implements JsonConverter<Color, String?> {
  const ColorJsonConverter();

  @override
  Color fromJson(String? s) {
    return s?.toColorInt.toColor ?? defaultColor;
  }

  @override
  String toJson(Color o) => o.toString();
}
