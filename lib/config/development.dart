
import 'package:sample/config/enum.dart';
import 'package:sample/env.dart';

void main() async => Development();

class Development extends Env {
  @override
  final String baseUrl = 'https://api.test.sample';
  @override
  final String clientId = '7447470b94d841e6bb739d427ade60f8';

  @override
  final AppEnvironment appEnvironment = AppEnvironment.Development;
}

