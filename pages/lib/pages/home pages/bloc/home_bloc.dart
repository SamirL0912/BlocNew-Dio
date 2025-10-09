import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/home_services.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService service;

  HomeBloc(this.service) : super(HomeInitial()) {
    on<LoadStats>((event, emit) async {
      emit(HomeLoading());
      try {
        final data = await service.getStats();

        emit(HomeSuccess(
          partidos: data['partidos'],
          goles: data['goles'],
          asistencias: data['asistencias'],
        ));
      } catch (e) {
        emit(HomeFailure("Error al cargar estadísticas: $e"));
      }
    });
  }
}
