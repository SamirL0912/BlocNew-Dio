import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/services/home_service.dart';

class HomeState {
  final String info;
  final bool loading;
  final String? error;
  final bool mostrandoBio;

  const HomeState({
    required this.info,
    this.loading = false,
    this.error,
    this.mostrandoBio = true,
  });

  HomeState copyWith({
    String? info,
    bool? loading,
    String? error,
    bool? mostrandoBio,
  }) {
    return HomeState(
      info: info ?? this.info,
      loading: loading ?? this.loading,
      error: error,
      mostrandoBio: mostrandoBio ?? this.mostrandoBio,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  final HomeService service;

  HomeCubit(this.service)
    : super(const HomeState(info: "Esperando la biografía de Cristiano..."));

  Future<void> cargarCristianoBio() async {
    emit(state.copyWith(loading: true, error: null, mostrandoBio: true));
    try {
      final bio = await service.fetchCristianoBio();
      emit(state.copyWith(info: bio, loading: false, mostrandoBio: true));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }

  Future<void> cargarCristianoStats() async {
    emit(state.copyWith(loading: true, error: null, mostrandoBio: false));
    try {
      final stats = await service.fetchCristianoStats();
      emit(state.copyWith(info: stats, loading: false, mostrandoBio: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }

  Future<void> alternarInfo() async {
    if (state.mostrandoBio) {
      await cargarCristianoStats();
    } else {
      await cargarCristianoBio();
    }
  }
}
