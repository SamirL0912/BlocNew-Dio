part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final String username;
  final String email;
  final String phone;

  HomeSuccess({
    required this.username,
    required this.email,
    required this.phone,
  });
}

class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}
