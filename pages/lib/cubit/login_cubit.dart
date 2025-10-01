import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'login_state.dart';

class HomeCubit extends Cubit<LoginState> {
  final Dio dio = Dio();

  HomeCubit() : super(LoginInitial());

  Future<void> login(String username, String password) async {
    emit(LoginLoading());
    try {
      final response = await dio.post(
        "https://mocki.io/v1/43abbc03-5e35-4f2c-bc24-a7dcccea9911",
        data: {"username": username, "password": password},
      );

      final data = response.data;

      if (username == data["username"] && password == data["password"]) {
        emit(
          LoginSuccess(
            username: data["username"] ?? "",
            password: data["password"] ?? "",
          ),
        );
      } else {
        emit(LoginFailure("Usuario o contraseña incorrectos"));
      }
    } catch (e) {
      emit(LoginFailure("Error en la conexión: $e"));
    }
  }
}
