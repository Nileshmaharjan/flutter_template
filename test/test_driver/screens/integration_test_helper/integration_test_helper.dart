import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

FlutterDriver driver;

void runLoginFlow({bool showPDS = false}) {
  test('App starts and Should shows Login screen', () async {
    await driver.waitFor(find.text('Login to ebpearls'));
    await driver.waitFor(find.text('Login'));
  });
}

Future<bool> isPresent(SerializableFinder byValueKey, FlutterDriver driver,
    {Duration timeout = const Duration(seconds: 1)}) async {
  try {
    await driver.waitFor(byValueKey, timeout: timeout);
    return true;
  } catch (exception) {
    return false;
  }
}
