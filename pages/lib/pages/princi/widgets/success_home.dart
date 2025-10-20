import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class SuccessHome extends StatelessWidget {
  const SuccessHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading || state is HomeInitial) {
                  return const Column(
                    children: [
                      SizedBox(height: 10),
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text("Cargando estadísticas..."),
                    ],
                  );
                } else if (state is HomeSuccess) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Partidos: ${state.partidos}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Goles: ${state.goles}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Asistencias: ${state.asistencias}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                } else if (state is HomeFailure) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      border: Border.all(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Error: ${state.message}",
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
