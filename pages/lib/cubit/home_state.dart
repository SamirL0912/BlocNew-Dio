part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState  {}

class HomeSuccess extends HomeState {
  final String username;
  final String password;

  HomeSuccess({
    required this.username,
    required this.password,
  });
}

class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}