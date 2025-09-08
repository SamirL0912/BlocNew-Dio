import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'crear_event.dart';
part 'crear_state.dart';

class CrearBloc extends Bloc<CrearEvent, CrearState> {
  CrearBloc() : super(CrearInitial()) {
    on<CrearEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
