import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Dio dio = Dio();

  HomeBloc() : super(HomeInitial()) {
    on<HomeSubmitted>((event, emit) async {
      emit(HomeLoading());

      try {
        final response = await dio.get(
          "https://mocki.io/v1/f910195d-e81f-48fe-80f6-5f929db299fb",
        );
        final data = response.data;

        if (event.username == data["username"] &&
            event.password == data["password"]) {
          emit(
            HomeSuccess(
              username: data["username"],
              email: data["email"],
              phone: data["phone"],
            ),
          );
        } else {
          emit(HomeFailure("Usuario o contraseña incorrectos"));
        }
      } catch (e) {
        emit(HomeFailure("Error en la conexión: $e"));
      }
    });
  }
}
