import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/cubit/home_cubit.dart';
import 'package:pages/services/home_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // 👉 El cubit ahora recibe el service y carga la info
      create: (_) => HomeCubit(HomeService())..cargarInfo(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen fija de internet
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2BnteNjfRG7gC9q9ihU3F3YE-lpzKES_Tcg&s",
              height: 200,
            ),
            const SizedBox(height: 20),

            // Información que viene del Cubit
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.loading) {
                  return const CircularProgressIndicator();
                } else if (state.error != null) {
                  return Text(
                    "Error: ${state.error}",
                    style: const TextStyle(color: Colors.red),
                  );
                }
                return Text(
                  state.info,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                );
              },
            ),

            const SizedBox(height: 20),

            // Botón para recargar info desde la API
            ElevatedButton(
              onPressed: () {
                context.read<HomeCubit>().cargarInfo();
              },
              child: const Text("Recargar info"),
            )
          ],
        ),
      ),
    );
  }
}
