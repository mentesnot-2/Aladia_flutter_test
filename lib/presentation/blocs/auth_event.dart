part of 'auth_bloc.dart';

abstract class AuthEvent {}

class CheckUserEvent extends AuthEvent {
  final String email;

  CheckUserEvent(this.email);
}

class LoginEvent extends AuthEvent { // New LoginEvent class
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}
