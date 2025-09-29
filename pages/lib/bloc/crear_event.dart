import 'package:equatable/equatable.dart';

abstract class CrearEvent extends Equatable {
  const CrearEvent();

  @override
  List<Object?> get props => [];
}

class CrearSubmitted extends CrearEvent {
  final String name;
  final String password;

  const CrearSubmitted({required this.name, required this.password});

  @override
  List<Object?> get props => [name, password];
}
