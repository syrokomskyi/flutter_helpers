import 'package:dart_helpers/dart_helpers.dart';

import '../classes/aware.dart';
import 'device_extension.dart';

extension AwareJsonExtension on Aware {
  Map<String, dynamic> get json => <String, dynamic>{
        'screen size': screenSize().json,
        'screen orientation': screenOrientation().sd,
      };

  String get sjson => json.toString();
}
