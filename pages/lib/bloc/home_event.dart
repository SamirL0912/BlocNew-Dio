part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeSubmitted extends HomeEvent {
  final String username;
  final String password;

  HomeSubmitted({required this.username, required this.password});
}
