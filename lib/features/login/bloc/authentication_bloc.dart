import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:sample/features/login/repository/authentication_repository.dart';
import 'package:sample/utils/preferences.dart';

import 'bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Preferences preferences;
  final AuthRepository repository;

  AuthenticationBloc({
    @required this.repository,
    @required this.preferences,
  }) : super(null);

  AuthenticationState get initialState => InitialAuthenticationState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield InitialAuthenticationState();
    } else if (event is LoginWithUsernamePassword) {
      yield AuthenticationLoading();
      final result = await repository.login(event.userName, event.password);
      if (result) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationFailed();
      }
    }
  }
}
