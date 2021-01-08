import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super();
  @override
  List<Object> get props => throw UnimplementedError();
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';

}

class LoginWithUsernamePassword extends AuthenticationEvent {
  final String userName;
  final String password;

  LoginWithUsernamePassword(this.userName, this.password)
      : super([userName, password]);

  @override
  String toString() =>
      'LoginWithUsernamePassword { userName: $userName, password: $password }';
}

