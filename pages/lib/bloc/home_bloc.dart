import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Dio dio = Dio();

  HomeBloc() : super(HomeInitial()) {
    on<LoadStats>((event, emit) async {
      emit(HomeLoading());

      try {
        final response = await dio.get(
          "https://mocki.io/v1/bc56fb38-e3ad-4c8c-a8a6-a05e0eb15a1d",
        );
        final data = response.data;

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
