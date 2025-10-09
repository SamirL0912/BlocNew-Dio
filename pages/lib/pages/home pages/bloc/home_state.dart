abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final int partidos;
  final int goles;
  final int asistencias;

  HomeSuccess({
    required this.partidos,
    required this.goles,
    required this.asistencias,
  });
}

class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}
