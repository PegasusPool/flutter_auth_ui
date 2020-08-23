
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterAuthUiWeb {
  static const MethodChannel _channel =
      const MethodChannel('flutter_auth_ui_web');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
