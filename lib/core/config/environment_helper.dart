
import 'package:sample/env.dart';

enum EnvironmentKey { BaseUrl, ClientId }

class EnvironmentHelper {
  String getValue(EnvironmentKey key) {
    switch (key) {
      case EnvironmentKey.BaseUrl:
        return Env.value.baseUrl;
      case EnvironmentKey.ClientId:
        return Env.value.clientId;
      default:
        throw ArgumentError('Unrecognised environment key ${key}');
    }
  }
}
