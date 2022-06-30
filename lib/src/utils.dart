import 'dart:io' as io show Platform;
import 'dart:math';
import 'dart:ui' as ui;

import 'package:dart_helpers/dart_helpers.dart';
import 'package:flutter/material.dart' as material;
import 'package:package_info_plus/package_info_plus.dart';

Future<String> get appVersion async =>
    '${(await PackageInfo.fromPlatform()).version}'
    '.$operatingSystemOneLetter';

// For unit tests.
// \see debugCheckHasMediaQuery()
bool isCorrectContext(material.BuildContext context) {
  try {
    return context.widget is material.MediaQuery ||
        context.findAncestorWidgetOfExactType<material.MediaQuery>() != null;
  } catch (_) {
    return false;
  }
}

List<ui.Color> get allColors =>
    [...material.Colors.primaries, ...material.Colors.accents];

ui.Color get randomAccentColor => randomColor(material.Colors.accents);

ui.Color get randomPrimaryColor => randomColor(material.Colors.primaries);

ui.Color randomColor(List<ui.Color>? source) =>
    (source ?? allColors)[Random().nextInt((source ?? allColors).length)];

bool get isFlutterTestEnvironment =>
    io.Platform.environment.containsKey('FLUTTER_TEST');
