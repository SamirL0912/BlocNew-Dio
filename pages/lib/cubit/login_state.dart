part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String username;
  final String password;

  LoginSuccess({required this.username, required this.password});
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}
