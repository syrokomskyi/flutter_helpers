import 'package:dart_helpers/dart_helpers.dart';
import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math_64.dart';

import '../extensions/device_extension.dart';
import '../utils.dart';

/// \see https://docs.flutter.dev/development/ui/assets-and-images#resolution-aware
/// \see https://en.wikipedia.org/wiki/Aspect_ratio_(image)
class Aware {
  final BuildContext _context;
  final Vector2 defaultScreenSize;

  const Aware(this._context, this.defaultScreenSize);

  PreferredAspect get preferredAspect => PreferredAspect(screenSize());

  Vector2 realScreenSize() => screenSize() * devicePixelRatio();

  /*
  Vector2 screenSize() => (screenOrientation().isLandscape &&
          MediaQuery.of(context).size.x >
              MediaQuery.of(context).size.y)
      ? MediaQuery.of(context).size.toVector2()
      : MediaQuery.of(context).size.toVector2().swapped;
  */
  //Vector2 screenSize() =>
  //    _isCorrectContext() ? MediaQuery.of(context).size.toVector2() : Vector2.zero();
  Vector2 screenSize() {
    if (!isCorrectContext(_context) && isFlutterTestEnvironment) {
      return defaultScreenSize;
    }

    final ss = MediaQuery.of(_context).size;

    if (ss.width < ss.height && isScreenPortrait()) {
      return Vector2(ss.width, ss.height);
    }

    if (ss.width >= ss.height && isScreenLandscape()) {
      return Vector2(ss.width, ss.height);
    }

    if (ss.width < ss.height && isScreenLandscape()) {
      return Vector2(ss.height, ss.width);
    }

    return Vector2(ss.width, ss.height);
  }

  double devicePixelRatio() => isCorrectContext(_context)
      ? MediaQuery.of(_context).devicePixelRatio
      : 1.0;

  Orientation screenOrientation() => isCorrectContext(_context)
      ? MediaQuery.of(_context).orientation
      : Orientation.portrait;

  static Orientation orientation(Vector2 size) =>
      size.x > size.y ? Orientation.landscape : Orientation.portrait;

  bool isScreenLandscape() => screenOrientation().isLandscape;

  bool isScreenPortrait() => screenOrientation().isPortrait;

  static bool isLandscape(Vector2 size) => orientation(size).isLandscape;

  static bool isPortrait(Vector2 size) => orientation(size).isPortrait;

  Vector2? realScreenBestSize(List<Vector2> spriteSizes) =>
      PreferredAspect(realScreenSize()).bestSize(spriteSizes);
}
