import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/services/dio_services.dart';
import 'crear_event.dart';
import 'crear_state.dart';

class CrearBloc extends Bloc<CrearEvent, CrearState> {
  final DioService dioService;

  CrearBloc(this.dioService) : super(CrearInitial()) {
    on<CrearSubmitted>((event, emit) async {
      if (event.name.isEmpty || event.password.isEmpty) {
        emit(CrearFailure(message: "Por favor ingresa usuario y contraseña"));
        return;
      }

      emit(CrearLoading());

      try {
        final success = await dioService.login(event.name, event.password);

        if (success) {
          emit(CrearSuccess());
        } else {
          emit(CrearFailure(message: "Usuario o contraseña incorrectos"));
        }
      } catch (e) {
        emit(CrearFailure(message: "Error de conexión: $e"));
      }
    });
  }
}
