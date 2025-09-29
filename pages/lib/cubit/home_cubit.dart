import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';
import '../services/home_service.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeService _service;

  HomeCubit(this._service) : super(HomeState());

  Future<void> cargarCristianoBio() async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final bio = await _service.getCristianoBio();
      emit(state.copyWith(loading: false, info: bio, mostrandoBio: true));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  Future<void> cargarCristianoStats() async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final stats = await _service.getCristianoStats();
      emit(state.copyWith(loading: false, info: stats, mostrandoBio: false));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  void alternarInfo() {
    if (state.mostrandoBio) {
      cargarCristianoStats();
    } else {
      cargarCristianoBio();
    }
  }
}
