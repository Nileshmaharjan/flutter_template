import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart' as dio;
import 'package:sample/config/enum.dart';
import 'package:sample/core/config/environment_helper.dart';
import 'package:sample/core/config/feature_toggles.dart';
import 'package:sample/core/device/device_helper.dart';
import 'package:sample/features/login/bloc/authentication_bloc.dart';
import 'package:sample/features/login/repository/authentication_api_client.dart';
import 'package:sample/features/login/repository/authentication_repository.dart';
import 'package:sample/providers/api_client.dart';
import 'package:sample/utils/preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future init(AppEnvironment appEnvironment) async {
  // Feature toggles
  sl.registerSingleton(FeatureToggles(appEnvironment));

  // Device
  sl.registerFactory(() => FlutterSecureStorage());

  // Config
  sl.registerSingleton(EnvironmentHelper());
  sl.registerSingleton(DeviceHelper());

  //Connectivity
  sl.registerSingleton(Connectivity());

  //Preferences
  sl.registerSingleton(Preferences());

  //Bloc
  sl.registerLazySingleton<AuthenticationBloc>(
      () => AuthenticationBloc(preferences: sl(), repository: sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository(sl(), sl()));

  // Api client
  sl.registerFactory(() => dio.Dio(dio.BaseOptions(
      baseUrl: sl<EnvironmentHelper>().getValue(EnvironmentKey.BaseUrl))));
  sl.registerLazySingleton(() => ApiClient(sl(), sl(), sl()));
  sl.registerLazySingleton(() => AuthApiClient(sl()));

  return await sl.allReady();
}
