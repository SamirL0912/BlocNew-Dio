import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/bloc/home_bloc.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc+Dio")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://www.hola.com/horizon/square/e48159e847bc-cristiano-ronaldo.jpg",
              height: 200,
            ),
            const SizedBox(height: 20),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeInitial || state is HomeLoading) {
                  return const CircularProgressIndicator();
                } else if (state is HomeSuccess) {
                  return Column(
                    children: [
                      Text(
                        "Partidos: ${state.partidos}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Goles: ${state.goles}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Asistencias: ${state.asistencias}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  );
                } else if (state is HomeFailure) {
                  return Text(
                    "Error: ${state.message}",
                    style: const TextStyle(color: Colors.red),
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
