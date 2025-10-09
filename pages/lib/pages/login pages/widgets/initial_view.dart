import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/login_cubit.dart';

class InitialLoginView extends StatefulWidget {
  const InitialLoginView({super.key});

  @override
  State<InitialLoginView> createState() => _InitialLoginViewState();
}

class _InitialLoginViewState extends State<InitialLoginView> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _userController,
            decoration: const InputDecoration(labelText: "Usuario"),
          ),
          TextField(
            controller: _passController,
            obscureText: true,
            decoration: const InputDecoration(labelText: "Contraseña"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<LoginCubit>().login(
                _userController.text,
                _passController.text,
              );
            },
            child: const Text("Agregar"),
          ),
        ],
      ),
    );
  }
}
