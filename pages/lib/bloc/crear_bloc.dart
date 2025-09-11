import 'package:flutter_bloc/flutter_bloc.dart';
import 'crear_event.dart';
import 'crear_state.dart';

class CrearBloc extends Bloc<CrearEvent, CrearState> {
  CrearBloc() : super(CrearInitial()) {
    on<CrearSubmitted>((event, emit) async {
      emit(CrearLoading());
      // Simulamos un proceso (ej: login, petición API, etc.)
      await Future.delayed(const Duration(seconds: 2));
      // Aquí decides si va a Success o Failure
      final success = true; // puedes cambiarlo para probar

      if (success) {
        emit(CrearSuccess());
      } else {
        emit(CrearFailure());
      }
    });
  }
}
