import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

void showAlert(String message) {
  Fluttertoast.showToast(msg: message);
}

String generateId() {
  return const Uuid().v1();
}

Future<String?> getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.device; // unique ID on Android
  }
  return "";
}

const String postPlaceholderUrl =
    "https://www.slntechnologies.com/wp-content/uploads/2017/08/ef3-placeholder-image.jpg";

const String userPlaceholderUrl =
    "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png";

enum FileTypeUpload { image, video }
