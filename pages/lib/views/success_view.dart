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
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const CircularProgressIndicator();
            } else if (state is HomeSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.username, style: const TextStyle(fontSize: 20)),
                  Text(state.email, style: const TextStyle(fontSize: 20)),
                  Text(state.phone, style: const TextStyle(fontSize: 20)),
                ],
              );
            } else if (state is HomeFailure) {
              return Text(
                "Error: ${state.message}",
                style: const TextStyle(color: Colors.red),
              );
            }
            return const Text("Esperando datos...");
          },
        ),
      ),
    );
  }
}
