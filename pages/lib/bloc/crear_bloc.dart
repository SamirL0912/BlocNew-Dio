import 'package:flutter_bloc/flutter_bloc.dart';
import 'crear_event.dart';
import 'crear_state.dart';

class CrearBloc extends Bloc<CrearEvent, CrearState> {
  CrearBloc() : super(CrearInitial()) {
    on<CrearSubmitted>((event, emit) async {
      emit(CrearLoading());
      await Future.delayed(const Duration(seconds: 2));
      final success = true;
      if (success) {
        emit(CrearSuccess());
      } else {
        emit(CrearFailure());
      }
    });
  }
}
