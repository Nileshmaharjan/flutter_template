import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginMechanism {
  static const String email = 'EMAIL';
  static const String fingerprint = 'FINGERPRINT';
  static const String face = 'FACE';
  static const String pin = 'PIN';
}

class Preference {
  static final String loginMechanism = 'LOGIN_MECHANISM';

  // One-time question: user asked if they want to use a PIN for authentication
  static final String loginMechanismPinAsk = 'LOGIN_MECHANISM_PIN_ASK';

  // Flag indicating if fingerprint authentication is supported
  static final String credentialsFingerprintAvailable =
      'CREDENTIALS_FINGERPRINT_AVAILABLE';

  static final String credentialsFaceAvailable = 'CREDENTIALS_FACE_AVAILABLE';

  static final String firstName = 'USERS_FIRST_NAME';

  static final String isWelcomeScreenSeen = 'IS_WELCOME_SCREEN_SEEN';

  static final String invalidPinCount = 'INVALID_PIN_COUNT';

  static final String pin = 'PIN';

  static final String accessToken = 'ACCESS_TOKEN';

  static final String refreshToken = 'REFRESH_TOKEN';
}

class Preferences {
  static final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static final Preferences _singleton = Preferences._internal();

  factory Preferences() {
    return _singleton;
  }

  Preferences._internal();

  Future saveString(String name, String value) async {
    await _secureStorage.write(key: name.toLowerCase(), value: value);
  }

  Future saveBool(String name, bool value) async {
    await _secureStorage.write(
        key: name.toLowerCase(), value: value.toString());
  }

  Future<String> getString(String name) async {
    return await _secureStorage.read(key: name.toLowerCase());
  }

  Future<bool> getBool(String name) async {
    final value = await _secureStorage.read(key: name.toLowerCase());
    return value == 'true';
  }

  Future<int> getInt(String name) async {
    final value = await _secureStorage.read(key: name.toLowerCase());
    var intValue = value ?? '0';
    return int.parse(intValue);
  }

  Future saveInt(String name, int value) async {
    await _secureStorage.write(
        key: name.toLowerCase(), value: value.toString());
  }

  Future remove(String name) async {
    await _secureStorage.delete(key: name.toLowerCase());
  }
}
