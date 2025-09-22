import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/cubit/home_cubit.dart';
import 'package:pages/services/home_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(HomeService())..cargarCristianoBio(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Cristiano Ronaldo")),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              Image.network(
                "https://www.hola.com/horizon/square/e48159e847bc-cristiano-ronaldo.jpg",
                height: 200,
              ),

              const SizedBox(height: 20),

              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: Center(
                      child:
                          state.loading
                              ? const CircularProgressIndicator()
                              : state.error != null
                              ? Text(
                                "Error: ${state.error}",
                                style: const TextStyle(color: Colors.red),
                                textAlign: TextAlign.center,
                              )
                              : Text(
                                state.info,
                                style: const TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<HomeCubit>().alternarInfo();
                    },
                    child: Text(
                      state.mostrandoBio ? "Ver Estadísticas" : "Ver Biografía",
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
