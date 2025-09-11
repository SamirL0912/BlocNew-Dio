import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/crear_bloc.dart';
import '../bloc/crear_event.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulario Inicial")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Cuando presionas, envías el evento al Bloc
            context.read<CrearBloc>().add(CrearSubmitted());
          },
          child: const Text("Enviar"),
        ),
      ),
    );
  }
}
