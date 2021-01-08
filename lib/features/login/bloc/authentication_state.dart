import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const []]);

  @override
  List<Object> get props => props;
}

class InitialAuthenticationState extends AuthenticationState {
  @override
  String toString() => 'InitialAuthenticationState';
}

class AuthenticationAuthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}

class AuthenticationUseUsernameAndPassword extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUseUsernameAndPassword';
}

class AuthenticationFailed extends AuthenticationState {
  final errorMessage;

  AuthenticationFailed({this.errorMessage});

  @override
  String toString() => 'AuthenticationFailed';
}
