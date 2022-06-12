import 'dart:ui' as ui;

import 'package:json_annotation/json_annotation.dart';

class SizeIntNullJsonConverter implements JsonConverter<ui.Size?, List?> {
  const SizeIntNullJsonConverter();

  @override
  ui.Size? fromJson(List? l) => l == null || l.length < 2
      ? ui.Size.zero
      : ui.Size((l[0] as num).roundToDouble(), (l[1] as num).roundToDouble());

  @override
  List<double> toJson(ui.Size? o) =>
      o == null ? [] : [o.width.roundToDouble(), o.height.roundToDouble()];
}

class SizeIntJsonConverter implements JsonConverter<ui.Size, List> {
  const SizeIntJsonConverter();

  @override
  ui.Size fromJson(List l) => l.length < 2
      ? ui.Size.zero
      : ui.Size((l[0] as num).roundToDouble(), (l[1] as num).roundToDouble());

  @override
  List<double> toJson(ui.Size o) =>
      [o.width.roundToDouble(), o.height.roundToDouble()];
}
