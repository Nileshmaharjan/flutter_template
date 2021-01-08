import 'dart:math';

import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

int calculateCompoundInterest(int p, double r, int n) {
  // A = P*(1+r)^n
  if (p < 0 || r < 0 || n < 0) {
    return 0;
  }
  return (p * pow((1 + r), n)).floor();
}

Future<String> getAppVersionNumber() async {
  final packageInfo = await PackageInfo.fromPlatform();
  return 'ver. ${packageInfo.version}+${packageInfo.buildNumber}';
}

void copyTextInKeyboard(String text) {
  Clipboard.setData(ClipboardData(text: text));
}

double sumDouble(double value, double sumValue) {
  var newDouble = (value + sumValue).toStringAsFixed(1);
  return double.parse(newDouble);
}

double subDouble(double value, double subValue) {
  var newDouble = (value - subValue).toStringAsFixed(1);
  return double.parse(newDouble);
}

void launchExternal(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}

bool isNumberIsInGivenRange(int maxValue, int minValue, int value) {
  return minValue <= value && value <= maxValue;
}
