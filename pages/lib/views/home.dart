import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/cubit/home_cubit.dart';
import 'package:pages/services/home_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(HomeService())..cargarCristianoInfo(),
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
    if (state.loading) {
      return const CircularProgressIndicator();
    } else if (state.error != null) {
      return Text(
        "Error: ${state.error}",
        style: const TextStyle(color: Colors.red),
      );
    } else {
      return Text(
        state.info,
        style: const TextStyle(fontSize: 20),
      );
    }
  },
),

              const SizedBox(height: 20),
              ElevatedButton(
  onPressed: () {
    context.read<HomeCubit>().cargarCristianoInfo();
  },
  child: const Text("Actualizar info"),
)

            ],
          ),
        ),
      ),
    );
  }
}
