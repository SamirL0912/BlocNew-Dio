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
          "https://mocki.io/v1/4ba4ef1e-1121-44ce-b2ec-43d8236507cd",
        );
        final data = response.data;

        await Future.delayed(const Duration(seconds: 3));

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
