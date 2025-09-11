import 'package:flutter_bloc/flutter_bloc.dart';

class HomeState {
  final String info;

  const HomeState({required this.info});

  HomeState copyWith({String? info}) {
    return HomeState(
      info: info ?? this.info,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(info: "Información inicial"));

  void actualizarInfo(String nuevaInfo) {
    emit(state.copyWith(info: nuevaInfo));
  }
}
