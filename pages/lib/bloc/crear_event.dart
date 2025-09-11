import 'package:equatable/equatable.dart';

abstract class CrearEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CrearSubmitted extends CrearEvent {}
