// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:device_info_plus/device_info_plus.dart';

Future<String> getDeviceIdentifier() async {
  // Add your function code here!
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  try {
    WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    return webBrowserInfo.userAgent ?? webBrowserInfo.browserName.name;
  } catch (e) {
    try {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id + androidInfo.model;
    } catch (e) {
      try {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.utsname.machine;
      } catch (e) {
        return "Not Defined";
      }
    }
  }
}
