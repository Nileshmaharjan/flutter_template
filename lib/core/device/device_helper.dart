import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

class DeviceHelper {
  final _deviceInfoPlugin = DeviceInfoPlugin();
  String _deviceIdentity;

  Future<String> getDeviceIdentifier() async {
    try {
      if (Platform.isAndroid) {
        var info = await _deviceInfoPlugin.androidInfo;
        _deviceIdentity = '${info.device}-${info.id}';
      } else if (Platform.isIOS) {
        var info = await _deviceInfoPlugin.iosInfo;
        _deviceIdentity = '${info.model}-${info.identifierForVendor}';
      }
    } on PlatformException {
      _deviceIdentity = 'unknown';
    }

    return _deviceIdentity;
  }
}
