import 'package:equatable/equatable.dart';

abstract class CrearState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CrearInitial extends CrearState {}

class CrearLoading extends CrearState {}

class CrearSuccess extends CrearState {}

class CrearFailure extends CrearState {}
