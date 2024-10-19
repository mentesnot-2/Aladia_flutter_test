part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String accessToken; // Include accessToken

  AuthSuccess(this.accessToken); // Constructor to accept the token
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}
