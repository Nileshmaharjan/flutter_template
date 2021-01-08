class LoginResponse {
  String accessToken;
  String refreshToken;

  LoginResponse({
    this.accessToken,
    this.refreshToken,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'] as String;
    refreshToken = json['refresh_token'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
