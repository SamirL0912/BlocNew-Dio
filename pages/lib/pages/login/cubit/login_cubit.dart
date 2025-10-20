import 'package:bloc/bloc.dart';
import 'package:pages/pages/login/services/api_services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginService _service;

  LoginCubit(this._service) : super(LoginInitial());

  Future<void> login(String username, String password) async {
    emit(LoginLoading());

    try {
      final success = await _service.login(username, password);

      if (success) {
        emit(LoginSuccess(username: username));
      } else {
        emit(LoginFailure("Usuario o contraseña incorrectos"));
      }
    } catch (e) {
      emit(LoginFailure("Error de conexión: $e"));
    }
  }
}
