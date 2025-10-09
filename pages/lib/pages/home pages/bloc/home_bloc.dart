import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/pages/home%20pages/services/home_services.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _service;

  HomeBloc(this._service) : super(HomeInitial()) {
    on<LoadStats>((event, emit) async {
      emit(HomeLoading());
      try {
        final data = await _service.getStats();
        emit(
          HomeSuccess(
            partidos: data["partidos"],
            goles: data["goles"],
            asistencias: data["asistencias"],
          ),
        );
      } catch (e) {
        emit(HomeFailure("Error en la conexión: $e"));
      }
    });
  }
}
