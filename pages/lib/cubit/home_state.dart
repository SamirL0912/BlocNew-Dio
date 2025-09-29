class HomeState {
  final bool loading;
  final String info;
  final String? error;
  final bool mostrandoBio;

  HomeState({
    this.loading = false,
    this.info = '',
    this.error,
    this.mostrandoBio = true,
  });

  HomeState copyWith({
    bool? loading,
    String? info,
    String? error,
    bool? mostrandoBio,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      info: info ?? this.info,
      error: error,
      mostrandoBio: mostrandoBio ?? this.mostrandoBio,
    );
  }
}
