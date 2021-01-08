
import 'package:sample/config/enum.dart';
import 'package:sample/env.dart';

void main() => Production();

class Production extends Env {
  @override
  final String baseUrl = 'https://api.test.sample';
  @override
  final String clientId = '024aa1da6412461baca63b3d27f9d1df';

  @override
  final AppEnvironment appEnvironment = AppEnvironment.Production;
}
