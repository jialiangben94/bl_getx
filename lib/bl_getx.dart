import 'dart:async';

import 'package:flutter/services.dart';

export 'src/base_widget.dart';
export 'src/base_page.dart';
export 'src/base_controller.dart';
export 'src/base_state.dart';
export 'src/util.dart';

class BlGetx {
  static const MethodChannel _channel = MethodChannel('bl_getx');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
