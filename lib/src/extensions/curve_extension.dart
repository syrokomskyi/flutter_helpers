import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/animation.dart';

extension CurveExtension on Curve {
  static const curveList = <String, Curve>{
    'bounceIn': Curves.bounceIn,
    'bounceInOut': Curves.bounceInOut,
    'bounceOut': Curves.bounceOut,
    'decelerate': Curves.decelerate,
    'ease': Curves.ease,
    'easeInOutSine': Curves.easeInOutSine,
    'elasticIn': Curves.elasticIn,
    'linear': Curves.linear,
    // \todo Add more curves.
  };

  String get s =>
      curveList.keys.firstWhereOrNull(
        (key) => curveList[key] == this,
      ) ??
      '';
}

extension CurveBuildStringExtension on String {
  Curve? get buildCurve => CurveExtension.curveList[this];

  bool get isCurve => CurveExtension.curveList.keys.contains(this);
}
