import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Dio dio = Dio();

  LoginCubit() : super(LoginInitial());

  Future<void> login(String username, String password) async {
    emit(LoginLoading());

    try {
      final response = await dio.post(
        "https://68ddf036d7b591b4b78df267.mockapi.io/api/v1/login",
        data: {"username": username, "password": password},
      );

      final data = response.data;

      if (data["username"] == username && data["password"] == password) {
        emit(
          LoginSuccess(username: data["username"], password: data["password"]),
        );
      } else {
        emit(LoginFailure("Usuario o contraseña incorrectos"));
      }
    } catch (e) {
      emit(LoginFailure("Error en la conexión: $e"));
    }
  }
}
