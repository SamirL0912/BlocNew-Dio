import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/views/initial_view.dart';
import '../bloc/home_bloc.dart';

class FailureView extends StatelessWidget {
  const FailureView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state as HomeFailure;

    return Scaffold(
      appBar: AppBar(title: const Text("Error")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.message, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const InicialView()),
                );
              },
              child: const Text("Reintentar"),
            ),
          ],
        ),
      ),
    );
  }
}
