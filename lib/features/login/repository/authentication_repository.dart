import 'dart:async';

import 'package:sample/features/login/repository/authentication_api_client.dart';
import 'package:sample/utils/preferences.dart';

enum AuthRefreshResponse { SUCCESS, EXPIRES, ERROR, INCORRECT_PIN }

class AuthRepository {
  AuthApiClient _apiClient;
  Preferences _preferences;

  AuthRepository(AuthApiClient apiClient, Preferences preferences) {
    _apiClient = apiClient;
    _preferences = preferences;
  }

  Future<bool> login(
    String email,
    String password,
  ) async {
    try {
      final result = await _apiClient.login(email, password);
      await Future.wait([
        _setAccessToken(result.accessToken),
        _setRefreshToken(result.refreshToken)
      ]);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> getAccessToken() async =>
      await _preferences.getString(Preference.accessToken);

  Future _setAccessToken(String accessToken) async =>
      await _preferences.saveString(Preference.accessToken, accessToken);

  Future _setRefreshToken(String refreshToken) async =>
      await _preferences.saveString(Preference.refreshToken, refreshToken);
}
