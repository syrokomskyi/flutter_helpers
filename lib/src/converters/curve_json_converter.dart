import 'package:flutter/animation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../extensions/curve_extension.dart';

class CurveJsonConverter implements JsonConverter<Curve, String?> {
  static const defaultCurve = Curves.easeInOutSine;

  const CurveJsonConverter();

  @override
  Curve fromJson(String? s) {
    assert(s == null || s.isCurve);
    return s?.buildCurve ?? defaultCurve;
  }

  @override
  String toJson(Curve o) => o.s;
}
