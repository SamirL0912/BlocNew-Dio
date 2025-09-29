import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/crear_bloc.dart';
import '../bloc/crear_event.dart';
import '../bloc/crear_state.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final passController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Formulario Inicial")),
      body: BlocConsumer<CrearBloc, CrearState>(
        listener: (context, state) {
          if (state is CrearFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is CrearSuccess) {
            Navigator.pushReplacementNamed(context, "/home");
          }
        },

        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Nombre",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Contraseña",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),
                if (state is CrearLoading)
                  const CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: () {
                      final name = nameController.text.trim();
                      final password = passController.text.trim();

                      context.read<CrearBloc>().add(
                        CrearSubmitted(name: name, password: password),
                      );
                    },
                    child: const Text("Ingresar"),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
