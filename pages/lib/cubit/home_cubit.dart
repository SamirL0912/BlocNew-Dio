import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/services/home_service.dart';

class HomeState {
  final String info;
  final bool loading;
  final String? error;

  const HomeState({required this.info, this.loading = false, this.error});

  HomeState copyWith({String? info, bool? loading, String? error}) {
    return HomeState(
      info: info ?? this.info,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  final HomeService service;

  HomeCubit(this.service)
    : super(const HomeState(info: "Esperando la biografía de Cristiano..."));

  Future<void> cargarCristianoInfo() async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final bio = await service.fetchCristianoInfo();

      await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(info: bio, loading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }
}
