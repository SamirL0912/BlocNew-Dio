import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Dio dio = Dio();

  HomeCubit() : super(HomeInitial());

  Future<void> login(String username, String password) async {
    emit(HomeLoading());
    try {
      final response = await dio.post(
        "https://mocki.io/v1/43abbc03-5e35-4f2c-bc24-a7dcccea9911",
        data: {
          "username": username,
          "password": password,
        },
      );

      final data = response.data;

      if (username == data["username"] && password == data["password"]) {
        emit(HomeSuccess(
          username: data["username"] ?? "",
          password: data["password"] ?? "",
        ));
      } else {
        emit(HomeFailure("Usuario o contraseña incorrectos"));
      }
    } catch (e) {
      emit(HomeFailure("Error en la conexión: $e"));
    }
  }
}