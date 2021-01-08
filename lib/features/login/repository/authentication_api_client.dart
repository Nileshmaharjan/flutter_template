import 'dart:async';

import 'package:sample/features/login/models/login_response.dart';
import 'package:sample/providers/api_client.dart';

class AuthApiClient {
  ApiClient _apiClient;

  AuthApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<LoginResponse> login(
    String email,
    String password,
  ) async {
    // final response = await _apiClient.httpPost('/authentication/oauth2/token',
    //     {'username': email, 'password': password});
    await Future.delayed(Duration(seconds: 2));
    if (email == 'test@ebpearls.com' && password == '123456') {
      var response = {
        // assuming api returns this response
        'access_token': 'dummy-access-token',
        'refresh_token': 'dummy-refresh-token'
      };
      return LoginResponse.fromJson(response);
    } else {
      throw Exception('Incorrect username or password');
    }
  }
}
