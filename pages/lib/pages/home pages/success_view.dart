import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/pages/home%20pages/services/home_services.dart';
import 'bloc/home_bloc.dart';
import 'widgets/loading_home.dart';
import 'widgets/failure_home.dart';
import 'widgets/success_home.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(HomeService())..add(LoadStats()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Estadísticas de Cristiano")),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading || state is HomeInitial) {
              return const LoadingHome();
            } else if (state is HomeFailure) {
              return FailureHome(message: state.message);
            } else if (state is HomeSuccess) {
              return SuccessHome(
                partidos: state.partidos,
                goles: state.goles,
                asistencias: state.asistencias,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
