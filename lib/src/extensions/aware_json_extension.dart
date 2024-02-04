import 'package:json_dart/json_dart.dart';

import '../classes/aware.dart';
import 'device_extension.dart';

extension AwareJsonExtension on Aware {
  JsonMap get json => <String, dynamic>{
        'screen size': screenSize().json,
        'screen orientation': screenOrientation().sd,
      };

  String get sjson => json.toString();
}
